import { ethers } from "ethers";
import { useState } from "react";
function App() {
  const { ethereum } = window;
  let [account, setAccount] = useState("");
  let [contractData, setContractData] = useState("");

  const connectMetamask = async () => {
    if (window.ethereum) {
      const accounts = await ethereum.request({method: "eth_requestAccounts"});
      account = accounts[0];
      setAccount(account);
    }
  }


  const connectContract = async () => {
    const Address = "0x4a457D24F4a16367364b294880953767066f77D2";
    const ABI = [
      {
        "inputs": [
          {
            "internalType": "string",
            "name": "_word",
            "type": "string"
          }
        ],
        "name": "changeWord",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "myFlower",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ];
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const contract = new ethers.Contract( Address, ABI, signer );
    console.log(contract.address)
  }

  const getData = async () => {
    return;
  }
  return (
    <div className="App">
          <button onClick={connectMetamask}>CONNECT TO METAMASK</button>
          <p>{account}</p>
          <button onClick={connectContract}>CONNECT TO CONTRACT</button> <br /> <br />
          <button onClick={getData}>READ FROM CONTRACT</button>
          <p>{contractData}</p>
    </div>
  );
}
export default App;