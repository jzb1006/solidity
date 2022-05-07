pragma solidity ^0.8.0;

contract truthVote {

    enum States {
        REGISTER,
        VOTE,
        DISPERSE,
        WITHDRAW
    }

    address public owner = msg.sender;

    address [] trueVoters;
    address [] falseVoters;
    mapping(address => bool) voters;
    uint trueCount;
    uint falseCount;

    bool winner;
    uint winningCompensation;

    modifier postTransition(){
        _;
        goToNextState();
    }


    mapping(address => uint) hasVoted;


    uint VOTE_COST = 10;

    States state;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    modifier onlyVoter(){
        require(voters[msg.sender] != false);
        _;
    }

    modifier hasNotVoted(){
        require(hasVoted[msg.sender] == false);
        _;
    }

    modifier isCurrentState(States _state){
        require(state == _state);
        _;
    }

    function goToNextState() internal {
        state = States(uint(state) + 1);
    }

    modifier preTransition(){
        goToNextState();
        _;
    }

    function startVote() public onlyOwner() isCurrentState(States.REGISTER) {
        goToNextState();
    }


    function addVoter(address voter) public onlyOwner() isCurrentState(States.REGISTER) {
        voters[voter] = true;
    }

    function vote(bool val) public payable onlyVoter() isCurrentState(States.VOTE) {
        if (voters[msg.sender] == address(0) && msg.value >= VOTE_COST) {
            voters[msg.sender] = val;
            if (val) {
                trueCount++;
            } else {
                falseCount++;
            }
        }
    }

    function determine(bool val) public onlyOwner() isCurrentState(States.VOTE) postTransition() preTransition() {
        if (trueCount > falseCount) {
            winner = true;
            winningCompensation = VOTE_COST + (VOTE_COST * falseVoters.length) / trueVoters.length;
        } else if (falseCount > trueCount) {
            winner = false;
            winningCompensation = VOTE_COST + (VOTE_COST * trueVoters.length) / falseVoters.length;
        }
    }

    function withdraw() public onlyVoter() isCurrentState(States.WITHDRAW) {
        if(voters[msg.sender] != address(0)){
            if(voters[msg.sender] == winner){
                msg.sender.transfer(winningCompensation);
            }
        }
    }


    function disperse(bool val) public onlyOwner() preTransition() isCurrentState(States.DISPERSE) {
        address [] memory winningGroup;
        uint winningCompensation;
        if (trueVoters.length > falseVoters.length) {
            winningGroup = trueVoters;
            winningCompensation = VOTE_COST + (VOTE_COST * falseVoters.length) / trueVoters.length;
        } else if (trueVoters.length < falseVoters.length) {
            winningGroup = falseVoters;
            winningCompensation = VOTE_COST + (VOTE_COST * trueVoters.length) / falseVoters.length;
        } else {
            winningGroup = trueVoters;
            winningCompensation = VOTE_COST;
            for (uint i = 0; i < falseVoters.length; i++) {
                falseVoters[i].transfer(VOTE_COST);
            }
        }

        for (uint i = 0; i < winningGroup.length; i++) {
            winningGroup[i].transfer(winningCompensation);
        }
    }


}

