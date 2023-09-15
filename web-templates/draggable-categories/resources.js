function allowDrop(event) {
  event.preventDefault();
}

function drag(event) {
  event.dataTransfer.setData('text/plain', event.target.id);
}

function drop(event) {
  event.preventDefault();
  var data = event.dataTransfer.getData('text/plain');
  var draggedElement = document.getElementById(data);
  event.target.appendChild(draggedElement);
  
  // Gather the values and post them
  var droppableContainer = document.getElementById('droppable');
  var elementValues = Array.from(droppableContainer.getElementsByClassName('draggable')).map(function(element) {
    return element.innerText;
  });
  
  // Perform an HTTP POST request with the element values
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'your-server-url', true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4 && xhr.status === 200) {
      // Handle the server response
      console.log(xhr.responseText);
    }
  };
  
  var postData = JSON.stringify({ values: elementValues });
  xhr.send(postData);
}

