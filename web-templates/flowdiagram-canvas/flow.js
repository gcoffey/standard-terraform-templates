var containers = document.getElementsByClassName('container');
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

// Draw lines connecting related containers
function drawLines() {
  for (var i = 0; i < containers.length; i++) {
    var container = containers[i];
    var relationship = container.getAttribute('data-relationship');
    if (relationship) {
      var targetContainer = document.getElementById('container-' + relationship);
      if (targetContainer) {
        var containerRect = container.getBoundingClientRect();
        var targetRect = targetContainer.getBoundingClientRect();
        
        var containerX = containerRect.left + containerRect.width / 2;
        var containerY = containerRect.top + containerRect.height / 2;
        var targetX = targetRect.left + targetRect.width / 2;
        var targetY = targetRect.top + targetRect.height / 2;
        
        ctx.beginPath();
        ctx.moveTo(containerX, containerY);
        ctx.lineTo(targetX, targetY);
        ctx.strokeStyle = 'black';
        ctx.lineWidth = 2;
        ctx.stroke();
      }
    }
  }
}

drawLines();

