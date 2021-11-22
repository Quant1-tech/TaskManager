pragma solidity ^0.5.4;


contract TaskManager {
    uint public nTasks;

    enum TaskPhase { ToDo, InProgress, Done, Blocked, Review, Postponed, Canceled }

    struct TaskStruct {
        address owner;
        string name;
        TaskPhase phase;
        // Priority 1-5: 1 -> higher, 5 less important
        uint priority;
    }

    TaskStruct [] private tasks;

    mapping(address => uint[]) private myTasks;

    constructor () public {
        nTasks = 0;

    }

    /*
        Criar um tipo de evento TaskAdded
        Neste evento são informados o endereço do dono da tarefa;
        O nome da tarefa;
        Seu status e
        Sua prioridade

    */
    event TaskAdded (address owner, string name, TaskPhase phase, uint priority);

    
    /*
        modifier é utilizado para alterar o comportamento das funções.
        Por exemplo, eles podem verificar automaticamente uma condição antes de executar a função.
        Nosso projeto tem o modifier onlyOwner, que será utilizado para que somente o owner 
        possa acessar uma tarefa a partir do seu índice.
    */
    modifier onlyOwner (uint _taskIndex) {
        if (tasks[_taskIndex].owner == msg.sender){
            _;
        }
    }


    function updatePhase(uint _taskIndex, TaskPhase _phase) public onlyOwner (_taskIndex){
        tasks[_taskIndex].phase = _phase;
    }

    function getTask (uint _taskIndex) public view returns (address _owner, TaskPhase _phase, uint _priority){
        require (_taskIndex > 0 && _taskIndex < nTasks, "Index task not found");
        address _owner = tasks[_taskIndex].owner;
        TaskPhase _phase = tasks[_taskIndex].phase;
        uint _priority = tasks[_taskIndex].priority;
    }

}