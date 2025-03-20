// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MentalMathematics {
    // Struct to store student progress
    struct StudentProgress {
        string studentName;
        uint256 level;
        uint256 score;
    }

    // Mapping to store progress of each student by their address
    mapping(address => StudentProgress) public studentProgress;

    // Event to log progress updates
    event ProgressUpdated(address indexed student, string name, uint256 level, uint256 score);

    // Function to update student progress
    function updateProgress(string memory _name, uint256 _level, uint256 _score) public {
        require(_level > 0, "Level must be greater than 0");
        require(_score >= 0, "Score cannot be negative");

        studentProgress[msg.sender] = StudentProgress({
            studentName: _name,
            level: _level,
            score: _score
        });

        emit ProgressUpdated(msg.sender, _name, _level, _score);
    }

    // Function to get student progress
    function getProgress() public view returns (string memory, uint256, uint256) {
        StudentProgress memory progress = studentProgress[msg.sender];
        return (progress.studentName, progress.level, progress.score);
    }
}
