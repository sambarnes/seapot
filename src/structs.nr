// Translated from seaport-types:
// https://github.com/ProjectOpenSea/seaport-types/blob/0bd56c08d485ee5b3d5a20b0482a35a8ada60256/src/lib/ConsiderationStructs.sol

// @dev An order contains eleven components: an offerer, a zone (or account that
//      can cancel the order or restrict who can fulfill the order depending on
//      the type), the order type (specifying partial fill support as well as
//      restricted order status), the start and end time, a hash that will be
//      provided to the zone when validating restricted orders, a salt, a key
//      corresponding to a given conduit, a counter, and an arbitrary number of
//      offer items that can be spent along with consideration items that must
//      be received by their respective recipient.
//
struct OrderComponents {
    offerer: Field,
    zone: Field,
    offer: [OfferItem],
    consideration: [ConsiderationItem],
    orderType: Field, // enum OrderType
    startTime: Field,
    endTime: Field,
    zoneHash: [u8; 32],
    salt: Field,
    conduitKey: [u8; 32],
    counter: Field,
}


// @dev An offer item has five components: an item type (ETH or other native
//      tokens, ERC20, ERC721, and ERC1155, as well as criteria-based ERC721 and
//      ERC1155), a token address, a dual-purpose "identifierOrCriteria"
//      component that will either represent a tokenId or a merkle root
//      depending on the item type, and a start and end amount that support
//      increasing or decreasing amounts over the duration of the respective
//      order.
struct OfferItem {
    itemType: Field, // enum ItemType
    token: Field,
    identifierOrCriteria: Field,
    startAmount: Field,
    endAmount: Field,
}

// @dev A consideration item has the same five components as an offer item and
//      an additional sixth component designating the required recipient of the
//      item.
struct ConsiderationItem {
    itemType: Field, // enum ItemType
    token: Field,
    identifierOrCriteria: Field,
    startAmount: Field,
    endAmount: Field,
    recipient: Field,
}

// @dev A spent item is translated from a utilized offer item and has four
//      components: an item type (ETH or other native tokens, ERC20, ERC721, and
//      ERC1155), a token address, a tokenId, and an amount.
struct SpentItem {
    itemType: Field, // enum ItemType // Item type
    token: Field, // Token address
    identifier: Field, // Token ID
    amount: Field, // Amount
}

// @dev A received item is translated from a utilized consideration item and has
//      the same four components as a spent item, as well as an additional fifth
//      component designating the required recipient of the item.
struct ReceivedItem {
    itemType: Field, // enum ItemType // Item type
    token: Field, // Token address
    identifier: Field, // Token ID
    amount: Field, // Amount
    recipient: Field, // Required recipient
}

// @dev For basic orders involving ETH / native / ERC20 <=> ERC721 / ERC1155
//      matching, a group of six functions may be called that only requires a
//      subset of the usual order arguments. Note the use of a "basicOrderType"
//      enum; this represents both the usual order type as well as the "route"
//      of the basic order (a simple derivation function for the basic order
//      type is `basicOrderType = orderType + (4 * basicOrderRoute)`.)
struct BasicOrderParameters {
    // calldata offset
    considerationToken: Field, // 0x24
    considerationIdentifier: Field, // 0x44
    considerationAmount: Field, // 0x64
    offerer: Field, // 0x84
    zone: Field, // 0xa4
    offerToken: Field, // 0xc4
    offerIdentifier: Field, // 0xe4
    offerAmount: Field, // 0x104
    basicOrderType: Field, // enum BasicOrderType // 0x124
    startTime: Field, // 0x144
    endTime: Field, // 0x164
    zoneHash: [u8; 32], // 0x184
    salt: Field, // 0x1a4
    offererConduitKey: [u8; 32], // 0x1c4
    fulfillerConduitKey: [u8; 32], // 0x1e4
    totalOriginalAdditionalRecipients: Field, // 0x204
    additionalRecipients: [AdditionalRecipient], // 0x224
    signature: [u8], // 0x244
    // Total length, excluding dynamic array data: 0x264 (580)
}

// @dev Basic orders can supply any number of additional recipients, with the
//      implied assumption that they are supplied from the offered ETH (or other
//      native token) or ERC20 token for the order.
struct AdditionalRecipient {
    amount: Field, // Amount
    recipient: Field, // Recipient
}

// @dev The full set of order components, with the exception of the counter,
//      must be supplied when fulfilling more sophisticated orders or groups of
//      orders. The total number of original consideration items must also be
//      supplied, as the caller may specify additional consideration items.
struct OrderParameters {
    offerer: Field, // Offerer
    zone: Field, // Zone
    offer: [OfferItem], // Offer items
    consideration: [ConsiderationItem], // Consideration items
    orderType: Field, // enum OrderType // Order type
    startTime: Field, // Start time
    endTime: Field, // End time
    zoneHash: [u8; 32], // Zone hash
    salt: Field, // Salt
    conduitKey: [u8; 32], // Conduit key
    totalOriginalConsiderationItems: Field, // Total number of original consideration items
    // offer.length                          // 0x160
}

// @dev Orders require a signature in addition to the other order parameters.
struct Order {
    parameters: OrderParameters,
    signature: [u8],
}

// @dev Advanced orders include a numerator (i.e. a fraction to attempt to fill)
//      and a denominator (the total size of the order) in addition to the
//      signature and other order parameters. It also supports an optional field
//      for supplying extra data; this data will be provided to the zone if the
//      order type is restricted and the zone is not the caller, or will be
//      provided to the offerer as context for contract order types.
struct AdvancedOrder {
    parameters: OrderParameters,
    numerator: u120, // Numerator
    denominator: u120, // Denominator
    signature: [u8], // Signature
    extraData: [u8], // Extra data
}

// @dev Orders can be validated (either explicitly via `validate`, or as a
//      consequence of a full or partial fill), specifically cancelled (they can
//      also be cancelled in bulk via incrementing a per-zone counter), and
//      partially or fully filled (with the fraction filled represented by a
//      numerator and denominator).
struct OrderStatus {
    isValidated: bool, // Is validated
    isCancelled: bool, // Is cancelled
    numerator: u120, // Numerator
    denominator: u120, // Denominator
}

// @dev A criteria resolver specifies an order, side (offer vs. consideration),
//      and item index. It then provides a chosen identifier (i.e. tokenId)
//      alongside a merkle proof demonstrating the identifier meets the required
//      criteria.
struct CriteriaResolver {
    orderIndex: Field, // Order index
    side: Field, // enum Side
    index: Field, // Item index
    identifier: Field, // Token ID
    criteriaProof: [[u8; 32]], // Criteria proof
}

// @dev A fulfillment is applied to a group of orders. It decrements a series of
//      offer and consideration items, then generates a single execution
//      element. A given fulfillment can be applied to as many offer and
//      consideration items as desired, but must contain at least one offer and
//      at least one consideration that match. The fulfillment must also remain
//      consistent on all key parameters across all offer items (same offerer,
//      token, type, tokenId, and conduit preference) as well as across all
//      consideration items (token, type, tokenId, and recipient).
struct Fulfillment {
    offerComponents: [FulfillmentComponent], // Offer components
    considerationComponents: [FulfillmentComponent] // Consideration components
}

// @dev Each fulfillment component contains one index referencing a specific
//      order and another referencing a specific offer or consideration item.
struct FulfillmentComponent {
    orderIndex: Field, // Order index
    itemIndex: Field, // Item index
}

// @dev An execution is triggered once all consideration items have been zeroed
//      out. It sends the item in question from the offerer to the item's
//      recipient, optionally sourcing approvals from either this contract
//      directly or from the offerer's chosen conduit if one is specified. An
//      execution is not provided as an argument, but rather is derived via
//      orders, criteria resolvers, and fulfillments (where the total number of
//      executions will be less than or equal to the total number of indicated
//      fulfillments) and returned as part of `matchOrders`.
struct Execution {
    item: ReceivedItem, // Received item
    offerer: Field, // Offerer
    conduitKey: [u8; 32], // Conduit key
}

// @dev Restricted orders are validated post-execution by calling validateOrder
//      on the zone. This struct provides context about the order fulfillment
//      and any supplied extraData, as well as all order hashes fulfilled in a
//      call to a match or fulfillAvailable method.
struct ZoneParameters {
    orderHash: [u8; 32], // Order hash
    fulfiller: Field, // Fulfiller
    offerer: Field, // Offerer
    offer: [SpentItem], // Offer items
    consideration: [ReceivedItem], // Consideration items
    extraData: [u8], // Extra data
    orderHashes: [[u8; 32]], // Order hashes
    startTime: Field, // Start time
    endTime: Field, // End time
    zoneHash: [u8; 32], // Zone hash
}

// @dev Zones and contract offerers can communicate which schemas they implement
//      along with any associated metadata related to each schema.
struct Schema {
    id: Field, // Schema ID
    metadata: [u8], // Metadata
}
