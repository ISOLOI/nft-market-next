// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenId;

    address contractAddress;

    constructor(address marketPlaceAddresss)
        ERC721("Metaverse Tokens", "METT")
    {
        contractAddress = marketPlaceAddresss;
    }

    function createToken(string memory tokenURI) public returns (uint256) {
        _tokenId.increment();
        uint256 newTokenId = _tokenId.current();
        // minting token
        _mint(msg.sender, newTokenId);
        // _setTokenURI(key, value);
        _setTokenURI(newTokenId, tokenURI);
        // this allows the token to be transferrable
        setApprovalForAll(contractAddress, true);
        // we return this Id so that the frontend could use it
        return newTokenId;
    }
}
