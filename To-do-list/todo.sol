// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract ToDoList {

    // In order to represent each todo we should use a struct with necessary fields.

    struct ToDo {
        string content; // Field representing the text of the todo.
        bool finished; // Field for checking if todo is finished or not.
    }

    ToDo [] public todos; // Array of todos which is basically the todo list.

    function updateContent(string calldata _content, uint _index) external {
        // Method for updating the text of a todo with given index. 
        todos[_index].content = _content;
    }

    function getTodo (uint _index) external view returns (string memory, bool) {
        // Method for obtaining the todo struct  with given index.
        ToDo memory target = todos[_index];
        return(target.content, target.finished);
    }

    function changeCompleted(uint _index) external {
        // Method for updating the finished field of a todo with given index.
        todos[_index].finished = !todos[_index].finished;
    }

    function addTodo (string calldata _content) external {
        // Method for adding a  new todo with content input to the array of todos.
        todos.push(ToDo({
            content: _content,
            finished: false
        }));
    }
}