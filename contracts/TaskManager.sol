pragma solidity ^0.5.4;

contract TaskManager {
    uint public nTaks;

    enum TaskPhase { ToDo, InProgress, Done, Blocked, Review, Postponed, Canceled }

    struct TaskStruct {
        address owner;
        string name;
        TaskPhase phase;
        // Priority 1-5: 1 -> higher, 5 less important
        uint priority;
    }

}