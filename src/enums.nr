// Translated from seaport-types:
// https://github.com/ProjectOpenSea/seaport-types/blob/0bd56c08d485ee5b3d5a20b0482a35a8ada60256/src/lib/ConsiderationEnums.sol

// TODO: figure out how to better represent enums than a bunch of globals

//
// enum OrderType
//
mod OrderType {
    // 0: no partial fills, anyone can execute
    global FULL_OPEN: Field = 0;

    // 1: partial fills supported, anyone can execute
    global PARTIAL_OPEN: Field = 1;

    // 2: no partial fills, only offerer or zone can execute
    global FULL_RESTRICTED: Field = 2;

    // 3: partial fills supported, only offerer or zone can execute
    global PARTIAL_RESTRICTED: Field = 3;

    // 4: contract order type
    global CONTRACT: Field = 4;
}

//
// enum BasicOrderType
//
mod BasicOrderType {
    // 0: no partial fills, anyone can execute
    global ETH_TO_ERC721_FULL_OPEN: Field = 0;

    // 1: partial fills supported, anyone can execute
    global ETH_TO_ERC721_PARTIAL_OPEN: Field = 1;

    // 2: no partial fills, only offerer or zone can execute
    global ETH_TO_ERC721_FULL_RESTRICTED: Field = 2;

    // 3: partial fills supported, only offerer or zone can execute
    global ETH_TO_ERC721_PARTIAL_RESTRICTED: Field = 3;

    // 4: no partial fills, anyone can execute
    global ETH_TO_ERC1155_FULL_OPEN: Field = 4;

    // 5: partial fills supported, anyone can execute
    global ETH_TO_ERC1155_PARTIAL_OPEN: Field = 5;

    // 6: no partial fills, only offerer or zone can execute
    global ETH_TO_ERC1155_FULL_RESTRICTED: Field = 6;

    // 7: partial fills supported, only offerer or zone can execute
    global ETH_TO_ERC1155_PARTIAL_RESTRICTED: Field = 7;

    // 8: no partial fills, anyone can execute
    global ERC20_TO_ERC721_FULL_OPEN: Field = 8;

    // 9: partial fills supported, anyone can execute
    global ERC20_TO_ERC721_PARTIAL_OPEN: Field = 9;

    // 10: no partial fills, only offerer or zone can execute
    global ERC20_TO_ERC721_FULL_RESTRICTED: Field = 10;

    // 11: partial fills supported, only offerer or zone can execute
    global ERC20_TO_ERC721_PARTIAL_RESTRICTED: Field = 11;

    // 12: no partial fills, anyone can execute
    global ERC20_TO_ERC1155_FULL_OPEN: Field = 12;

    // 13: partial fills supported, anyone can execute
    global ERC20_TO_ERC1155_PARTIAL_OPEN: Field = 13;

    // 14: no partial fills, only offerer or zone can execute
    global ERC20_TO_ERC1155_FULL_RESTRICTED: Field = 14;

    // 15: partial fills supported, only offerer or zone can execute
    global ERC20_TO_ERC1155_PARTIAL_RESTRICTED: Field = 15;

    // 16: no partial fills, anyone can execute
    global ERC721_TO_ERC20_FULL_OPEN: Field = 16;

    // 17: partial fills supported, anyone can execute
    global ERC721_TO_ERC20_PARTIAL_OPEN: Field = 17;

    // 18: no partial fills, only offerer or zone can execute
    global ERC721_TO_ERC20_FULL_RESTRICTED: Field = 18;

    // 19: partial fills supported, only offerer or zone can execute
    global ERC721_TO_ERC20_PARTIAL_RESTRICTED: Field = 19;

    // 20: no partial fills, anyone can execute
    global ERC1155_TO_ERC20_FULL_OPEN: Field = 20;

    // 21: partial fills supported, anyone can execute
    global ERC1155_TO_ERC20_PARTIAL_OPEN: Field = 21;

    // 22: no partial fills, only offerer or zone can execute
    global ERC1155_TO_ERC20_FULL_RESTRICTED: Field = 22;

    // 23: partial fills supported, only offerer or zone can execute
    global ERC1155_TO_ERC20_PARTIAL_RESTRICTED: Field = 23;
}

//
// enum BasicOrderRouteType
//
mod BasicOrderRouteType {
    // 0: provide Ether (or other native token) to receive offered ERC721 item.
    global ETH_TO_ERC721: Field = 0;

    // 1: provide Ether (or other native token) to receive offered ERC1155 item.
    global ETH_TO_ERC1155: Field = 1;

    // 2: provide ERC20 item to receive offered ERC721 item.
    global ERC20_TO_ERC721: Field = 2;

    // 3: provide ERC20 item to receive offered ERC1155 item.
    global ERC20_TO_ERC1155: Field = 3;

    // 4: provide ERC721 item to receive offered ERC20 item.
    global ERC721_TO_ERC20: Field = 4;

    // 5: provide ERC1155 item to receive offered ERC20 item.
    global ERC1155_TO_ERC20: Field = 5;
}


//
// enum ItemType
//
mod ItemType {
    // 0: ETH on mainnet, MATIC on polygon, etc.
    global NATIVE: Field = 0;

    // 1: ERC20 items (ERC777 and ERC20 analogues could also technically work)
    global ERC20: Field = 1;

    // 2: ERC721 items
    global ERC721: Field = 2;

    // 3: ERC1155 items
    global ERC1155: Field = 3;

    // 4: ERC721 items where a number of tokenIds are supported
    global ERC721_WITH_CRITERIA: Field = 4;

    // 5: ERC1155 items where a number of ids are supported
    global ERC1155_WITH_CRITERIA: Field = 5;
}

//
// enum Side
//
mod Side {
    // 0: Items that can be spent
    global OFFER: Field = 0;

    // 1: Items that must be received
    global CONSIDERATION: Field = 1;
}
