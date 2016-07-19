
function resetIt() {
    var instance = Processing.getInstanceById('ball_sketch');    
    instance.setup();
}

document.getElementById('reset').addEventListener('click', resetIt);