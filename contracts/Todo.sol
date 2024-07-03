// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Todo {
    struct TodoList {
        string title;
        string notes;
        uint256 createdAt;
    }

    // Mapping to store todo items for each address
    mapping(address => TodoList[]) public userTodos;

    function addTodo(string calldata _title, string calldata _notes) external {
        userTodos[msg.sender].push(TodoList(_title, _notes, block.timestamp));
    }

    function getTodos() external view returns (TodoList[] memory) {
        return userTodos[msg.sender];
    }

    function deleteTodo(uint256 _index) external {
        // Ensure the index is within the bounds of the array
        require(_index < userTodos[msg.sender].length, "Data Not Found");

        // Shift elements to the left to fill the gap
        for (uint256 i = _index; i < userTodos[msg.sender].length - 1; i++) {
            userTodos[msg.sender][i] = userTodos[msg.sender][i + 1];
        }
        // Remove the last element
        userTodos[msg.sender].pop();
    }

    function updateTodo(
        uint256 _index,
        string calldata _title,
        string calldata _notes
    ) external {
        require(_index < userTodos[msg.sender].length, "Data Not Found");

        userTodos[msg.sender][_index] = TodoList(
            _title,
            _notes,
            block.timestamp
        );
    }
}
