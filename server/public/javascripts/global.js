// Userlist data array for filling in info box
var userListData = [];
var messageListData = [];

// DOM Ready =============================================================
$(document).ready(function() {

  // Populate the tables on initial page load
  populateTables();
  
  // Refresh button
  $('body').on('click', '#refresh', populateTables);

  // Username link click
  $('#userList table tbody').on('click', 'td a.linkshowuser', showUserInfo);

  // Add User button click
  $('#btnAddUser').on('click', addUser);

  // Delete User link click
  $('#userList table tbody').on('click', 'td a.linkdeleteuser', deleteUser);
  
  // Message Clear All click
  $('#messageList').on('click', '#clear', clearMessages);
  
  // Username link click
  $('#messageList table tbody').on('click', 'td a.linkshowmessage', showMessageInfo);
  
  // Delete Message link click
  $('#messageList table tbody').on('click', 'td a.linkdeletemessage', deleteMessage);

});

// Functions =============================================================

// Fill table with data
function populateTables() {

  // Empty content string
  var userTableContent = '';
  var messageTableContent = '';

  // jQuery AJAX call for users JSON
  $.getJSON('/users', function(data) {

    // Stick our user data array into a userlist variable in the global object
    userListData = data;

    // For each item in our JSON, add a table row and cells to the content string
    $.each(data, function() {
      userTableContent += '<tr>';
      userTableContent += '<td><a href="#" class="linkshowuser" rel="' + this.name + '" title="Show Details">' + this.name + '</a></td>';
      userTableContent += '<td>' + this.email + '</td>';
      userTableContent += '<td><a href="#" class="linkdeleteuser" rel="' + this._id + '">delete</a></td>';
      userTableContent += '</tr>';
    });

    // Inject the whole content string into our existing HTML table
    $('#userList table tbody').html(userTableContent);
  });
  
  // jQuery AJAX call for messages JSON
  $.getJSON('/messages', function(data) {

    // Stick our user data array into a messagelist variable in the global object
    messageListData = data;

    // For each item in our JSON, add a table row and cells to the content string
    $.each(data, function() {
      var searchId = this.userId;
      var userName = "";
      $.each(userListData, function() {
        if (this["_id"] == searchId) userName = this.name
      });
      this.userName = userName;
      messageTableContent += '<tr>';
      messageTableContent += '<td>' + userName + '</td>';
      messageTableContent += '<td><a href="#" class="linkshowmessage" rel="' + this._id + '" title="Show Details">' + this.text + '</a></td>';
      messageTableContent += '<td><a href="#" class="linkshowmessage" rel="' + this._id + '" title="Show Details">' + (this.image ? '<img src="data:image/png;base64,' + this.image + '" height="120">' : '') + '</a></td>';
      messageTableContent += '<td><a href="#" class="linkdeletemessage" rel="' + this._id + '">delete</a></td>';
      messageTableContent += '</tr>';
    });

    // Inject the whole content string into our existing HTML table
    $('#messageList table tbody').html(messageTableContent);
  });
};

// Show User Info
function showUserInfo(event) {

  // Prevent Link from Firing
  event.preventDefault();

  // Retrieve username from link rel attribute
  var thisUserName = $(this).attr('rel');

  // Get Index of object based on id value
  var arrayPosition = userListData.map(function(arrayItem) {
    return arrayItem.name;
  }).indexOf(thisUserName);

  // Get our User Object
  var thisUserObject = userListData[arrayPosition];

  //Populate Info Box
  $('#userInfoId').text(thisUserObject._id);
  $('#userInfoName').text(thisUserObject.name);
  $('#userInfoEmail').text(thisUserObject.email);
};

// Add User
function addUser(event) {
  event.preventDefault();

  // Super basic validation - increase errorCount variable if any fields are blank
  var errorCount = 0;
  $('#addUser input').each(function(index, val) {
    if ($(this).val() === '') {
      errorCount++;
    }
  });

  // Check and make sure errorCount's still at zero
  if (errorCount === 0) {

    // If it is, compile all user info into one object
    var newUser = {
      'name': $('#addUser fieldset input#inputUserName').val(),
      'email': $('#addUser fieldset input#inputUserEmail').val(),
    }

    // Use AJAX to post the object to our adduser service
    $.ajax({
      type: 'POST',
      data: newUser,
      url: '/users',
      dataType: 'JSON'
    }).done(function(response) {

      // Check for successful response
      if (!response.msg) {

        // Clear the form inputs
        $('#addUser fieldset input').val('');

        // Update the table
        populateTables();

      } else {

        // If something goes wrong, alert the error message that our service returned
        alert('Error: ' + response.msg);

      }
    });
  } else {
    // If errorCount is more than 0, error out
    alert('Please fill in all fields');
    return false;
  }
};

// Delete User
function deleteUser(event) {

  event.preventDefault();

  // Pop up a confirmation dialog
  var confirmation = confirm('Are you sure you want to delete this user?');

  // Check and make sure the user confirmed
  if (confirmation === true) {

    // If they did, do our delete
    $.ajax({
      type: 'DELETE',
      url: '/users/' + $(this).attr('rel')
    }).done(function(response) {

      // Check for a successful (blank) response
      if (response.msg === '') {} else {
        alert('Error: ' + response.msg);
      }

      // Update the table
      populateTables();

    });

  } else {

    // If they said no to the confirm, do nothing
    return false;

  }

};

// Show User Info
function showMessageInfo(event) {

  // Prevent Link from Firing
  event.preventDefault();

  // Retrieve username from link rel attribute
  var thisMessageId = $(this).attr('rel');

  // Get Index of object based on id value
  var arrayPosition = messageListData.map(function(arrayItem) {
    return arrayItem._id;
  }).indexOf(thisMessageId);

  // Get our User Object
  var thisMessageObject = messageListData[arrayPosition];

  //Populate Info Box
  $('#messageInfoId').text(thisMessageObject._id);
  $('#messageInfoUserName').text(thisMessageObject.userName);
  $('#messageInfoText').text(thisMessageObject.text);
  $('#messageInfoImage').html(thisMessageObject.image ? '<img src="data:image/png;base64,' + thisMessageObject.image + '" width="' + $('#messageInfoImage').parent().width() + '">' : '');
};

// Delete Message
function deleteMessage(event) {

  event.preventDefault();

  // If they did, do our delete
  $.ajax({
    type: 'DELETE',
    url: '/messages/' + $(this).attr('rel')
  }).done(function(response) {

    // Check for a successful (blank) response
    if (response.msg === '') {} else {
      alert('Error: ' + response.msg);
    }

    // Update the table
    populateTables();

  });
};

// Clear messages
function clearMessages(event) {
  event.preventDefault();

  // Clear all messages
  $.ajax({
    type: 'DELETE',
    url: '/messages/'
  }).done(function(response) {
  
    // Update the table
    populateTables();
    
  });
};
