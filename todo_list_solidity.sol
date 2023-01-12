// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.7;

 // insert, update, read from array of structs
 contract TodoList {
    struct Todo {
         // // inside the struct we'll store two fields
         string text; // "todo" will be the description
         bool completed; // Adding "to do" to work as completed and not completed
    }

    // we are declaring an array of the struct
    Todo[] public todos;

    // 3 ways to initialize a struct
    // calling it like a function

    // creating a todo 
    function create(string calldata _text) external {
        //pushing _text into the todo array
        todos.push(Todo({
            text: _text,
            completed: false}));
    }

    //updating description of the given index of the array
    function updateText(uint _index, string calldata _text) external {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // calling "to do"
    function get(uint _index) external view returns (string memory, bool){
        // storage - 29397 gas --- cheaper option
        // memory - 29480 gas
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // marking as completed/incompleted function
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
 }