// ========================================================================
// FIRESENSE CHAT SYSTEM - JavaScript with Role Restrictions & Real-Time Updates
// ========================================================================
// Save as: static/js/chat.js
// ========================================================================

let currentRoomId = null;
let messagePollingInterval = null;
let lastMessageId = 0;
let userRole = null;
let canCreateRooms = false;

// ==================== INITIALIZATION ====================

document.addEventListener('DOMContentLoaded', function() {
    loadChatRooms();
    updateUnreadCount();
    
    // Poll for new messages every 3 seconds
    setInterval(function() {
        if (currentRoomId) {
            loadRoomMessages(currentRoomId, false);
        }
        updateUnreadCount();
    }, 3000);
    
    // Update all message times every 30 seconds
    setInterval(function() {
        updateAllMessageTimes();
    }, 30000);
});

// ==================== CHAT ROOMS ====================

async function loadChatRooms() {
    try {
        const response = await fetch('/api/chat/rooms');
        const data = await response.json();
        
        if (data.success) {
            // Store user permissions
            userRole = data.user_role;
            canCreateRooms = data.can_create;
            
            // Show/hide create button based on permissions
            const createBtn = document.getElementById('createRoomBtn');
            if (createBtn) {
                createBtn.style.display = canCreateRooms ? 'block' : 'none';
            }
            
            displayChatRooms(data.rooms);
        }
    } catch (error) {
        console.error('Error loading chat rooms:', error);
    }
}

function displayChatRooms(rooms) {
    const roomsList = document.getElementById('roomsList');
    
    if (rooms.length === 0) {
        roomsList.innerHTML = `
            <div style="padding: 20px; text-align: center; color: var(--text-secondary);">
                <p>No chat rooms yet</p>
                ${canCreateRooms ? '<p style="font-size: 12px;">Click + to create one</p>' : ''}
            </div>
        `;
        return;
    }
    
    roomsList.innerHTML = rooms.map(room => `
        <div class="chat-room-item ${room.id === currentRoomId ? 'active' : ''}" 
             onclick="selectRoom(${room.id})">
            <div class="room-header">
                <div style="display: flex; align-items: center; gap: 8px;">
                    <div class="room-name">${room.name}</div>
                    ${room.can_delete ? `
                        <button class="delete-room-btn" onclick="deleteRoom(${room.id}, '${room.name}', event)" title="Delete room (Admin only)">
                            🗑️
                        </button>
                    ` : ''}
                </div>
                ${room.unread_count > 0 ? `<div class="room-badge">${room.unread_count}</div>` : ''}
            </div>
            ${room.last_message ? `
                <div class="room-last-message">
                    <strong>${room.last_message.user}:</strong> ${room.last_message.text || 'Attachment'}
                </div>
                <div class="room-time">${formatTime(room.last_message.time)}</div>
            ` : '<div class="room-last-message">No messages yet</div>'}
        </div>
    `).join('');
}

async function selectRoom(roomId) {
    currentRoomId = roomId;
    
    // Update UI
    document.getElementById('emptyState').style.display = 'none';
    document.getElementById('chatArea').style.display = 'flex';
    
    // Load messages
    await loadRoomMessages(roomId, true);
    
    // Update room list
    loadChatRooms();
}

// ==================== DELETE ROOM ====================

async function deleteRoom(roomId, roomName, event) {
    // Stop event from selecting the room
    event.stopPropagation();
    
    // Confirm deletion
    if (!confirm(`Are you sure you want to delete the room "${roomName}"?\n\nThis will hide the room and all its messages.`)) {
        return;
    }
    
    try {
        const response = await fetch(`/api/chat/rooms/${roomId}/delete`, {
            method: 'DELETE'
        });
        
        const data = await response.json();
        
        if (data.success) {
            // Show success message
            if (typeof showToast === 'function') {
                showToast(data.message, 'success');
            } else {
                alert(data.message);
            }
            
            // If currently viewing this room, go back to empty state
            if (currentRoomId === roomId) {
                currentRoomId = null;
                document.getElementById('emptyState').style.display = 'flex';
                document.getElementById('chatArea').style.display = 'none';
            }
            
            // Reload rooms
            await loadChatRooms();
        } else {
            alert('Failed to delete room: ' + data.error);
        }
    } catch (error) {
        console.error('Error deleting room:', error);
        alert('Failed to delete room. Please try again.');
    }
}

// ==================== MESSAGES ====================

async function loadRoomMessages(roomId, scrollToBottom = true) {
    try {
        const response = await fetch(`/api/chat/rooms/${roomId}/messages`);
        const data = await response.json();
        
        if (data.success) {
            // Update room header
            document.getElementById('currentRoomName').textContent = data.room.name;
            document.getElementById('currentRoomType').textContent = 
                data.room.room_type.charAt(0).toUpperCase() + data.room.room_type.slice(1) + ' Chat';
            
            // Display messages
            displayMessages(data.messages, scrollToBottom);
            
            // Mark messages as read
            markRoomMessagesAsRead(roomId);
        }
    } catch (error) {
        console.error('Error loading messages:', error);
    }
}

function displayMessages(messages, scrollToBottom) {
    const messagesList = document.getElementById('messagesList');
    
    if (messages.length === 0) {
        messagesList.innerHTML = `
            <div style="text-align: center; padding: 40px; color: var(--text-secondary);">
                <p>No messages yet</p>
                <p style="font-size: 14px;">Be the first to send a message!</p>
            </div>
        `;
        return;
    }
    
    // Save scroll position
    const wasAtBottom = messagesList.scrollHeight - messagesList.scrollTop === messagesList.clientHeight;
    
    messagesList.innerHTML = messages.map(msg => {
        // Build "Seen by" text
        let seenByText = '';
        if (msg.is_mine && msg.read_by && msg.read_by.length > 0) {
            const readers = msg.read_by.map(r => r.username).join(', ');
            const icon = msg.read_by.length === 1 ? '✓' : '✓✓';
            seenByText = `
                <div class="message-seen-by" title="Seen by: ${readers}">
                    <span class="seen-icon">${icon}</span>
                    <span class="seen-text">Seen by ${readers}</span>
                </div>
            `;
        } else if (msg.is_mine) {
            // Message sent but not seen yet
            seenByText = `
                <div class="message-seen-by">
                    <span class="seen-icon unseen">✓</span>
                    <span class="seen-text">Sent</span>
                </div>
            `;
        }
        
        return `
        <div class="message ${msg.is_mine ? 'mine' : ''}">
            <div class="message-avatar">
                ${msg.username.charAt(0).toUpperCase()}
            </div>
            <div class="message-content">
                <div class="message-header">
                    <div class="message-username">${msg.username}</div>
                    <div class="message-time" title="${formatFullTimestamp(msg.created_at)}">${formatTime(msg.created_at)}</div>
                </div>
                <div class="message-bubble">
                    ${escapeHtml(msg.message)}
                    ${msg.is_edited ? '<div style="font-size: 11px; opacity: 0.7; margin-top: 4px;">(edited)</div>' : ''}
                    ${msg.attachment_name ? `
                        <div class="message-attachment">
                            📎 <a href="${msg.attachment_url}" target="_blank">${msg.attachment_name}</a>
                        </div>
                    ` : ''}
                </div>
                ${seenByText}
            </div>
        </div>
        `;
    }).join('');
    
    // Scroll to bottom if needed
    if (scrollToBottom || wasAtBottom) {
        messagesList.scrollTop = messagesList.scrollHeight;
    }
    
    // Update last message ID
    if (messages.length > 0) {
        lastMessageId = messages[messages.length - 1].id;
    }
}

async function sendMessage(event) {
    event.preventDefault();
    
    const input = document.getElementById('messageInput');
    const message = input.value.trim();
    
    if (!message || !currentRoomId) return;
    
    try {
        const response = await fetch('/api/chat/messages/send', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                room_id: currentRoomId,
                message: message
            })
        });
        
        const data = await response.json();
        
        if (data.success) {
            input.value = '';
            await loadRoomMessages(currentRoomId, true);
            loadChatRooms(); // Update room list
        } else {
            alert('Failed to send message');
        }
    } catch (error) {
        console.error('Error sending message:', error);
        alert('Failed to send message');
    }
}

async function markRoomMessagesAsRead(roomId) {
    try {
        const response = await fetch(`/api/chat/rooms/${roomId}/messages`);
        const data = await response.json();
        
        if (data.success) {
            // Mark each unread message as read
            const markPromises = [];
            for (const msg of data.messages) {
                if (!msg.is_mine && !msg.is_read) {
                    markPromises.push(
                        fetch(`/api/chat/messages/${msg.id}/read`, {
                            method: 'POST'
                        })
                    );
                }
            }
            
            // Wait for all to complete
            if (markPromises.length > 0) {
                await Promise.all(markPromises);
                // Update unread count immediately
                await updateUnreadCount();
            }
        }
    } catch (error) {
        console.error('Error marking messages as read:', error);
    }
}

// ==================== NEW ROOM MODAL ====================

function openNewRoomModal() {
    // Check permission
    if (!canCreateRooms) {
        alert('Only Admins and Managers can create chat rooms.');
        return;
    }
    
    document.getElementById('newRoomModal').classList.add('active');
}

function closeNewRoomModal() {
    document.getElementById('newRoomModal').classList.remove('active');
    document.getElementById('newRoomName').value = '';
}

async function createNewRoom(event) {
    event.preventDefault();
    
    // Check permission
    if (!canCreateRooms) {
        alert('Only Admins and Managers can create chat rooms.');
        return;
    }
    
    const name = document.getElementById('newRoomName').value.trim();
    const type = document.getElementById('newRoomType').value;
    
    if (!name) return;
    
    try {
        const response = await fetch('/api/chat/rooms/create', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: name,
                room_type: type
            })
        });
        
        const data = await response.json();
        
        if (data.success) {
            closeNewRoomModal();
            
            // Show success message
            if (typeof showToast === 'function') {
                showToast(data.message || 'Chat room created successfully', 'success');
            }
            
            await loadChatRooms();
            selectRoom(data.room_id);
        } else {
            alert('Failed to create room: ' + (data.error || 'Unknown error'));
        }
    } catch (error) {
        console.error('Error creating room:', error);
        alert('Failed to create room. You may not have permission.');
    }
}

// ==================== UNREAD COUNT ====================

async function updateUnreadCount() {
    try {
        const response = await fetch('/api/chat/unread-count');
        const data = await response.json();
        
        if (data.success) {
            // Update navbar badge
            const chatLink = document.querySelector('a[href="/chat"]');
            if (chatLink) {
                let badge = chatLink.querySelector('.chat-badge');
                
                if (data.unread_count > 0) {
                    // Show/update badge
                    if (!badge) {
                        badge = document.createElement('span');
                        badge.className = 'chat-badge';
                        chatLink.appendChild(badge);
                    }
                    badge.textContent = data.unread_count;
                    badge.style.display = 'block';
                } else {
                    // Hide badge when no unread messages
                    if (badge) {
                        badge.style.display = 'none';
                    }
                }
            }
        }
    } catch (error) {
        console.error('Error updating unread count:', error);
    }
}

// ==================== UTILITIES ====================

// Format time in "X ago" style
function formatTime(timestamp) {
    if (!timestamp) return '';
    
    // Parse the timestamp - add 'Z' if not present to ensure UTC parsing
    let dateString = timestamp;
    if (!dateString.endsWith('Z') && !dateString.includes('+')) {
        dateString = timestamp + 'Z';
    }
    
    const date = new Date(dateString);
    const now = new Date();
    const diff = Math.floor((now - date) / 1000); // difference in seconds
    
    // Less than 10 seconds
    if (diff < 10) {
        return 'Just now';
    }
    
    // Less than 1 minute
    if (diff < 60) {
        return `${diff} seconds ago`;
    }
    
    // Less than 1 hour
    if (diff < 3600) {
        const minutes = Math.floor(diff / 60);
        return minutes === 1 ? '1 minute ago' : `${minutes} minutes ago`;
    }
    
    // Less than 24 hours
    if (diff < 86400) {
        const hours = Math.floor(diff / 3600);
        return hours === 1 ? '1 hour ago' : `${hours} hours ago`;
    }
    
    // Less than 7 days
    if (diff < 604800) {
        const days = Math.floor(diff / 86400);
        return days === 1 ? '1 day ago' : `${days} days ago`;
    }
    
    // Less than 30 days
    if (diff < 2592000) {
        const weeks = Math.floor(diff / 604800);
        return weeks === 1 ? '1 week ago' : `${weeks} weeks ago`;
    }
    
    // Less than 365 days
    if (diff < 31536000) {
        const months = Math.floor(diff / 2592000);
        return months === 1 ? '1 month ago' : `${months} months ago`;
    }
    
    // More than 365 days
    const years = Math.floor(diff / 31536000);
    return years === 1 ? '1 year ago' : `${years} years ago`;
}

// Format full timestamp for tooltip
function formatFullTimestamp(timestamp) {
    if (!timestamp) return '';
    
    // Parse the timestamp - add 'Z' if not present to ensure UTC parsing
    let dateString = timestamp;
    if (!dateString.endsWith('Z') && !dateString.includes('+')) {
        dateString = timestamp + 'Z';
    }
    
    const date = new Date(dateString);
    const options = { 
        year: 'numeric', 
        month: 'short', 
        day: 'numeric', 
        hour: '2-digit', 
        minute: '2-digit',
        second: '2-digit'
    };
    return date.toLocaleString('en-US', options);
}

// Update all message times (called every 30 seconds)
function updateAllMessageTimes() {
    // Re-render current room messages to update times
    if (currentRoomId) {
        loadRoomMessages(currentRoomId, false);
    }
    // Also update room list to refresh last message times
    loadChatRooms();
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

// ==================== KEYBOARD SHORTCUTS ====================

document.addEventListener('keydown', function(e) {
    // Escape key closes modal
    if (e.key === 'Escape') {
        closeNewRoomModal();
    }
});

// ==================== AUTO-RESIZE TEXTAREA ====================

document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('messageInput');
    if (input) {
        input.addEventListener('keydown', function(e) {
            // Enter to send (Shift+Enter for new line)
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                sendMessage(e);
            }
        });
    }
});
