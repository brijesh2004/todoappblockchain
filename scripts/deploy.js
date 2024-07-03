const hre = require("hardhat");

async function main() {
   // Log the deployer's address
   const [deployer] = await hre.ethers.getSigners();
   console.log("Deploying contracts with the account:", deployer.address);
 
   // Log the deployer's balance
   const balance = await deployer.getBalance();
   console.log("Account balance:", hre.ethers.utils.formatEther(balance.toString()), "ETH");
 
   // Create ABI and byte code of the smart contract
   const Todo = await hre.ethers.getContractFactory("Todo");
   console.log("Contract factory created");
 
   // Creating the instance of the smart contract
   const todo = await Todo.deploy();
   console.log("Contract deployment transaction sent");
 
   // Deploying the smart contract
   await todo.deployed();
   console.log("Contract deployed");
 
   // Log the contract address
   console.log(`Deployed contract address: ${todo.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
