require("dotenv").config();

const API_URL = process.env.API_URL;
const PUBLIC_KEY = process.env.PUBLIC_KEY;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const {createAlchemyWeb3} = require("@alch/alchemy-web3");
const web3 = createAlchemyWeb3(API_URL);
const contract = require("../artifacts/contracts/MyNFT.sol/MyNFT.json");
const contractAddress  = "0xf767f9ed5155c22354f94e77125755b3f7c43014";
const nftContract  = new web3.eth.Contract(contract.abi, contractAddress);

async function mintNFT(tokenURI) {
  const nonce = await web3.eth.getTransactionCount(PUBLIC_KEY,"latest");

  const tx = {
    'from': PUBLIC_KEY,
    'to': contractAddress,
    'nonce': nonce,
    'gas': 500000,
    'data': nftContract.methods.mintNFT(PUBLIC_KEY,tokenURI).encodeABI()
    };

    const signPromise = web3.eth.accounts.signTransaction(tx, PRIVATE_KEY);
    signPromise.then((singnedTx)=>{
        web3.eth.sendSignedTransaction(singnedTx.rawTransaction,function(err,hash){
            if(!err){
                console.log("The transaction has been sent to the network with hash: " + hash);
            }else{
                console.log("Something went wrong: " + err);
            }
        })
    }).catch((err)=>{
        console.log("Promise failed: " + err);
    })
}

mintNFT("ipfs://QmS9iF3grpAjJvwcEVgpfnrabmSVbVWmv2ZYF4GfBNQRBN");