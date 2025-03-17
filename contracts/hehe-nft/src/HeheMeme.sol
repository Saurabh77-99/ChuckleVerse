// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract HeheMeme is ERC721Enumerable, Ownable {
    uint256 private _nextTokenId;

    // Mapping from token ID to meme URL
    mapping(uint256 => string) private _memeUrls;
    
    event MemeMinted(uint256 indexed tokenId, address indexed minter, string memeUrl);

    constructor() ERC721("HeheMeme", "HEHE") Ownable(msg.sender) {}

    function mintMeme(string memory memeUrl) public returns (uint256) {
        require(bytes(memeUrl).length > 0, "URL cannot be empty");
        
        uint256 tokenId = _nextTokenId++;
        
        _mint(msg.sender, tokenId);
        _memeUrls[tokenId] = memeUrl;
        
        emit MemeMinted(tokenId, msg.sender, memeUrl);
        
        return tokenId;
    }

    function getMemeUrl(uint256 tokenId) public view returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        return _memeUrls[tokenId];
    }

    function isMemeUrlMinted(string memory memeUrl) public view returns (bool) {
        // Since we allow multiple mints of the same URL, this function
        // is kept for compatibility but will always return false
        return false;
    }

    // Override _increaseBalance from multiple inheritance
    function _increaseBalance(address account, uint128 amount) internal virtual override(ERC721Enumerable) {
        super._increaseBalance(account, amount);
    }

    // Override _update from multiple inheritance
    function _update(address to, uint256 tokenId, address auth) internal virtual override(ERC721Enumerable) returns (address) {
        return super._update(to, tokenId, auth);
    }

    // Override supportsInterface
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
// pragma solidity ^0.8.19;

// import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
// import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
// import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

// contract HeheMeme is ERC721,ERC721Enumerable, Ownable {
//     uint256 private _nextTokenId;

//     // Mapping from token ID to meme URL
//     mapping(uint256 => string) private _memeUrls;
    
//     event MemeMinted(uint256 indexed tokenId, address indexed minter, string memeUrl);

//     constructor() ERC721("HeheMeme", "HEHE") {}

//     function mintMeme(string memory memeUrl) public returns (uint256) {
//         require(bytes(memeUrl).length > 0, "URL cannot be empty");
        
//         uint256 tokenId = _nextTokenId++;
        
//         _safeMint(msg.sender, tokenId);
//         _memeUrls[tokenId] = memeUrl;
        
//         emit MemeMinted(tokenId, msg.sender, memeUrl);
        
//         return tokenId;
//     }

//     function getMemeUrl(uint256 tokenId) public view returns (string memory) {
//         require(_ownerOf(tokenId) != address(0), "Token does not exist");
//         return _memeUrls[tokenId];
//     }

//     function isMemeUrlMinted(string memory memeUrl) public view returns (bool) {
//         // Since we allow multiple mints of the same URL, this function
//         // is kept for compatibility but will always return false
//         return false;
//     }

//     // Override required function
//     function _beforeTokenTransfer(
//         address from,
//         address to,
//         uint256 firstTokenId,
//         uint256 batchSize
//     ) internal virtual override(ERC721Enumerable) {
//         super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
//     }

//     // Override required function
//     function supportsInterface(bytes4 interfaceId)
//         public
//         view
//         virtual
//         override(ERC721Enumerable)
//         returns (bool)
//     {
//         return super.supportsInterface(interfaceId);
//     }
// }