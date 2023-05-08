// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

/**
 * Can define own type by creating a struct
 * Useful for grouping related data together
 * structs can be delcared outsiode of a contract and imported in another contract
 */

contract Struct {
    struct Todo {
        string text;
        bool completed;
    }
    //an Array of Todos
    Todo[] public todos;

    function create(string calldata _text) public {
        //3 ways to initialize a struct

        //calling like a function
        todos.push(Todo(_text, false));

        //key value mapping
        todos.push(Todo({text: _text, completed: false}));

        //initialize an empty struct and then update
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    //Soldiuty automatically created a getter for todos so
    //you dont actually need this function
    function get(
        uint _index
    ) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
