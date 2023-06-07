// Translated from seaport-types:
// https://github.com/ProjectOpenSea/seaport-types/blob/0bd56c08d485ee5b3d5a20b0482a35a8ada60256/src/lib/ConsiderationConstants.sol

// -------------------------- Disambiguation & Other Notes ---------------------
//    - The term "head" is used as it is in the documentation for ABI encoding,
//      but only in reference to dynamic types, i.e. it always refers to the
//      offset or pointer to the body of a dynamic type. In calldata, the head
//      is always an offset (relative to the parent object), while in memory,
//      the head is always the pointer to the body. More information found here:
//      https://docs.soliditylang.org/en/v0.8.17/abi-spec.html#argument-encoding
//        - Note that the length of an array is separate from and precedes the
//          head of the array.
// 
//    - The term "body" is used in place of the term "head" used in the ABI
//      documentation. It refers to the start of the data for a dynamic type,
//      e.g. the first word of a struct or the first word of the first element
//      in an array.
// 
//    - The term "pointer" is used to describe the absolute position of a value
//      and never an offset relative to another value.
//        - The suffix "_ptr" refers to a memory pointer.
//        - The suffix "_cdPtr" refers to a calldata pointer.
// 
//    - The term "offset" is used to describe the position of a value relative
//      to some parent value. For example, OrderParameters_conduit_offset is the
//      offset to the "conduit" value in the OrderParameters struct relative to
//      the start of the body.
//        - Note: Offsets are used to derive pointers.
// 
//    - Some structs have pointers defined for all of their fields in this file.
//      Lines which are commented out are fields that are not used in the
//      codebase but have been left in for readability.

// Declare constants for name, version, and reentrancy sentinel values.

// Name is right padded, so it touches the length which is left padded. This
// enables writing both values at once. Length goes at byte 95 in memory, and
// name fills bytes 96-109, so both values can be written left-padded to 77.
global NameLengthPtr: Field = 0x4D;
global NameWithLength: Field = 0x0d436F6E73696465726174696F6E;

global information_version_offset: Field = 0;
global information_version_cd_offset: Field = 0x60;
global information_domainSeparator_offset: Field = 0x20;
global information_conduitController_offset: Field = 0x40;
global information_versionLengthPtr: Field = 0x63;
global information_versionWithLength: Field = 0x03312e35; // 1.5
global information_length: Field = 0xa0;

global _NOT_ENTERED: Field = 1;
global _ENTERED: Field = 2;
global _ENTERED_AND_ACCEPTING_NATIVE_TOKENS: Field = 3;

global Offset_fulfillAdvancedOrder_criteriaResolvers: Field = 0x20;
global Offset_fulfillAvailableOrders_offerFulfillments: Field = 0x20;
global Offset_fulfillAvailableOrders_considerationFulfillments: Field = 0x40;
global Offset_fulfillAvailableAdvancedOrders_criteriaResolvers: Field = 0x20;
global Offset_fulfillAvailableAdvancedOrders_offerFulfillments: Field = 0x40;
global Offset_fulfillAvailableAdvancedOrders_cnsdrationFlflmnts: Field = 0x60;

global Offset_matchOrders_fulfillments: Field = 0x20;

global Offset_matchAdvancedOrders_criteriaResolvers: Field = 0x20;
global Offset_matchAdvancedOrders_fulfillments: Field = 0x40;

// Common Offsets
// Offsets for identically positioned fields shared by:
// OfferItem, ConsiderationItem, SpentItem, ReceivedItem

global Selector_length: Field = 0x04;

global Common_token_offset: Field = 0x20;
global Common_identifier_offset: Field = 0x40;
global Common_amount_offset: Field = 0x60;
global Common_endAmount_offset: Field = 0x80;

global SpentItem_size: Field = 0x80;
global SpentItem_size_shift: Field = 0x07;

global OfferItem_size: Field = 0xa0;
global OfferItem_size_with_length: Field = 0xc0;

global ReceivedItem_size_excluding_recipient: Field = 0x80;
global ReceivedItem_size: Field = 0xa0;
global ReceivedItem_amount_offset: Field = 0x60;
global ReceivedItem_recipient_offset: Field = 0x80;

global ReceivedItem_CommonParams_size: Field = 0x60;

global ConsiderationItem_size: Field = 0xc0;
global ConsiderationItem_size_with_length: Field = 0xe0;

global ConsiderationItem_recipient_offset: Field = 0xa0;
// Store the same constant in an abbreviated format for a line length fix.
global ConsiderItem_recipient_offset: Field = 0xa0;

global Execution_offerer_offset: Field = 0x20;
global Execution_conduit_offset: Field = 0x40;

// global OrderParameters_offerer_offset: Field = 0x00;
global OrderParameters_zone_offset: Field = 0x20;
global OrderParameters_offer_head_offset: Field = 0x40;
global OrderParameters_consideration_head_offset: Field = 0x60;
// global OrderParameters_orderType_offset: Field = 0x80;
global OrderParameters_startTime_offset: Field = 0xa0;
global OrderParameters_endTime_offset: Field = 0xc0;
global OrderParameters_zoneHash_offset: Field = 0xe0;
// global OrderParameters_salt_offset: Field = 0x0100;
global OrderParameters_conduit_offset: Field = 0x0120;
global OrderParameters_counter_offset: Field = 0x0140;

global Fulfillment_itemIndex_offset: Field = 0x20;

global AdvancedOrder_head_size: Field = 0xa0;
global AdvancedOrder_numerator_offset: Field = 0x20;
global AdvancedOrder_denominator_offset: Field = 0x40;
global AdvancedOrder_signature_offset: Field = 0x60;
global AdvancedOrder_extraData_offset: Field = 0x80;

global OrderStatus_ValidatedAndNotCancelled: Field = 1;
global OrderStatus_filledNumerator_offset: Field = 0x10;
global OrderStatus_filledDenominator_offset: Field = 0x88;

global ThirtyOneBytes: Field = 0x1f;
global OneWord: Field = 0x20;
global TwoWords: Field = 0x40;
global ThreeWords: Field = 0x60;
global FourWords: Field = 0x80;
global FiveWords: Field = 0xa0;

global OneWordShift: Field = 0x05;
global TwoWordsShift: Field = 0x06;

global SixtyThreeBytes: Field = 0x3f;
global OnlyFullWordMask: Field = 0xffffffe0;

global FreeMemoryPointerSlot: Field = 0x40;
global ZeroSlot: Field = 0x60;
global DefaultFreeMemoryPointer: Field = 0x80;

global Slot0x80: Field = 0x80;
global Slot0xA0: Field = 0xa0;

// global BasicOrder_endAmount_cdPtr: Field = 0x0104;
global BasicOrder_common_params_size: Field = 0xa0;
global BasicOrder_considerationHashesArray_ptr: Field = 0x0160;
global BasicOrder_receivedItemByteMap: Field = 0x0000010102030000000000000000000000000000000000000000000000000000;
global BasicOrder_offeredItemByteMap: Field = 0x0203020301010000000000000000000000000000000000000000000000000000;

global OrdersMatchedTopic0: [u8; 32] = [0x4b, 0x99, 0x2f, 0x32, 0xed, 0xb3, 0xc6, 0x3e, 0xe1, 0x2b, 0xc4, 0x7c, 0xb9, 0x03, 0x1d, 0x9e, 0xd6, 0x42, 0x6c, 0x3c, 0xb0, 0xa7, 0x47, 0x0b, 0x20, 0x10, 0xdb, 0xc1, 0x2a, 0x09, 0x81, 0xed];

global EIP712_Order_size: Field = 0x0180;
global EIP712_OfferItem_size: Field = 0xc0;
global EIP712_ConsiderationItem_size: Field = 0xe0;
global AdditionalRecipient_size: Field = 0x40;
global AdditionalRecipient_size_shift: Field = 0x06;

global EIP712_DomainSeparator_offset: Field = 0x02;
global EIP712_OrderHash_offset: Field = 0x22;
global EIP712_DigestPayload_size: Field = 0x42;

global EIP712_domainData_nameHash_offset: Field = 0x20;
global EIP712_domainData_versionHash_offset: Field = 0x40;
global EIP712_domainData_chainId_offset: Field = 0x60;
global EIP712_domainData_verifyingContract_offset: Field = 0x80;
global EIP712_domainData_size: Field = 0xa0;

// Minimum BulkOrder proof size: 64 bytes for signature + 3 for key + 32 for 1
// sibling. Maximum BulkOrder proof size: 65 bytes for signature + 3 for key +
// 768 for 24 siblings.

global BulkOrderProof_minSize: Field = 0x63;
global BulkOrderProof_rangeSize: Field = 0x02e2;
global BulkOrderProof_lengthAdjustmentBeforeMask: Field = 0x1d;
global BulkOrderProof_lengthRangeAfterMask: Field = 0x02;
global BulkOrderProof_keyShift: Field = 0xe8;
global BulkOrderProof_keySize: Field = 0x03;

global BulkOrder_Typehash_Height_One: Field = 0x3ca2711d29384747a8f61d60aad3c450405f7aaff5613541dee28df2d6986d32;
global BulkOrder_Typehash_Height_Two: Field = 0xbf8e29b89f29ed9b529c154a63038ffca562f8d7cd1e2545dda53a1b582dde30;
global BulkOrder_Typehash_Height_Three: Field = 0x53c6f6856e13104584dd0797ca2b2779202dc2597c6066a42e0d8fe990b0024d;
global BulkOrder_Typehash_Height_Four: Field = 0xa02eb7ff164c884e5e2c336dc85f81c6a93329d8e9adf214b32729b894de2af1;
global BulkOrder_Typehash_Height_Five: Field = 0x39c9d33c18e050dda0aeb9a8086fb16fc12d5d64536780e1da7405a800b0b9f6;
global BulkOrder_Typehash_Height_Six: Field = 0x1c19f71958cdd8f081b4c31f7caf5c010b29d12950be2fa1c95070dc47e30b55;
global BulkOrder_Typehash_Height_Seven: Field = 0xca74fab2fece9a1d58234a274220ad05ca096a92ef6a1ca1750b9d90c948955c;
global BulkOrder_Typehash_Height_Eight: Field = 0x7ff98d9d4e55d876c5cfac10b43c04039522f3ddfb0ea9bfe70c68cfb5c7cc14;
global BulkOrder_Typehash_Height_Nine: Field = 0xbed7be92d41c56f9e59ac7a6272185299b815ddfabc3f25deb51fe55fe2f9e8a;
global BulkOrder_Typehash_Height_Ten: Field = 0xd1d97d1ef5eaa37a4ee5fbf234e6f6d64eb511eb562221cd7edfbdde0848da05;
global BulkOrder_Typehash_Height_Eleven: Field = 0x896c3f349c4da741c19b37fec49ed2e44d738e775a21d9c9860a69d67a3dae53;
global BulkOrder_Typehash_Height_Twelve: Field = 0xbb98d87cc12922b83759626c5f07d72266da9702d19ffad6a514c73a89002f5f;
global BulkOrder_Typehash_Height_Thirteen: Field = 0xe6ae19322608dd1f8a8d56aab48ed9c28be489b689f4b6c91268563efc85f20e;
global BulkOrder_Typehash_Height_Fourteen: Field = 0x6b5b04cbae4fcb1a9d78e7b2dfc51a36933d023cf6e347e03d517b472a852590;
global BulkOrder_Typehash_Height_Fifteen: Field = 0xd1eb68309202b7106b891e109739dbbd334a1817fe5d6202c939e75cf5e35ca9;
global BulkOrder_Typehash_Height_Sixteen: Field = 0x1da3eed3ecef6ebaa6e5023c057ec2c75150693fd0dac5c90f4a142f9879fde8;
global BulkOrder_Typehash_Height_Seventeen: Field = 0xeee9a1392aa395c7002308119a58f2582777a75e54e0c1d5d5437bd2e8bf6222;
global BulkOrder_Typehash_Height_Eighteen: Field = 0xc3939feff011e53ab8c35ca3370aad54c5df1fc2938cd62543174fa6e7d85877;
global BulkOrder_Typehash_Height_Nineteen: Field = 0x0efca7572ac20f5ae84db0e2940674f7eca0a4726fa1060ffc2d18cef54b203d;
global BulkOrder_Typehash_Height_Twenty: Field = 0x5a4f867d3d458dabecad65f6201ceeaba0096df2d0c491cc32e6ea4e64350017;
global BulkOrder_Typehash_Height_TwentyOne: Field = 0x80987079d291feebf21c2230e69add0f283cee0b8be492ca8050b4185a2ff719;
global BulkOrder_Typehash_Height_TwentyTwo: Field = 0x3bd8cff538aba49a9c374c806d277181e9651624b3e31111bc0624574f8bca1d;
global BulkOrder_Typehash_Height_TwentyThree: Field = 0x5d6a3f098a0bc373f808c619b1bb4028208721b3c4f8d6bc8a874d659814eb76;
global BulkOrder_Typehash_Height_TwentyFour: Field = 0x1d51df90cba8de7637ca3e8fe1e3511d1dc2f23487d05dbdecb781860c21ac1c;

global receivedItemsHash_ptr: Field = 0x60;

//   Memory layout in _prepareBasicFulfillmentFromCalldata of
//   data for OrderFulfilled
// 
//    event OrderFulfilled(
//      bytes32 orderHash,
//      address indexed offerer,
//      address indexed zone,
//      address fulfiller,
//      SpentItem[] offer,
//        > (itemType, token, id, amount)
//      ReceivedItem[] consideration
//        > (itemType, token, id, amount, recipient)
//    )
// 
//   - 0x00: orderHash
//   - 0x20: fulfiller
//   - 0x40: offer offset (0x80)
//   - 0x60: consideration offset (0x120)
//   - 0x80: offer.length (1)
//   - 0xa0: offerItemType
//   - 0xc0: offerToken
//   - 0xe0: offerIdentifier
//   - 0x100: offerAmount
//   - 0x120: consideration.length (1 + additionalRecipients.length)
//   - 0x140: considerationItemType
//   - 0x160: considerationToken
//   - 0x180: considerationIdentifier
//   - 0x1a0: considerationAmount
//   - 0x1c0: considerationRecipient
//   - ...


// Minimum length of the OrderFulfilled event data.
// Must be added to the size of the ReceivedItem array for additionalRecipients
// (0xa0 *  additionalRecipients.length) to calculate full size of the buffer.
global OrderFulfilled_baseSize: Field = 0x01e0;
global OrderFulfilled_selector: Field = 0x9d9af8e38d66c62e2c12f0225249fd9d721c54b83f48d9352c97c6cacdcb6f31;

// Minimum offset in memory to OrderFulfilled event data.
// Must be added to the size of the EIP712 hash array for additionalRecipients
// (32 *  additionalRecipients.length) to calculate the pointer to event data.
global OrderFulfilled_baseOffset: Field = 0x0180;
global OrderFulfilled_consideration_length_baseOffset: Field = 0x02a0;
global OrderFulfilled_offer_length_baseOffset: Field = 0x0200;

// Related constants used for restricted order checks on basic orders.
global OrderFulfilled_baseDataSize: Field = 0x0160;
// global ValidateOrder_offerDataOffset: Field = 0x0184;
// global RatifyOrder_offerDataOffset: Field = 0xc4;

// global OrderFulfilled_orderHash_offset: Field = 0x00;
global OrderFulfilled_fulfiller_offset: Field = 0x20;
global OrderFulfilled_offer_head_offset: Field = 0x40;
global OrderFulfilled_offer_body_offset: Field = 0x80;
global OrderFulfilled_consideration_head_offset: Field = 0x60;
global OrderFulfilled_consideration_body_offset: Field = 0x0120;

// BasicOrderParameters
global BasicOrder_parameters_cdPtr: Field = 0x04;
global BasicOrder_considerationToken_cdPtr: Field = 0x24;
global BasicOrder_considerationIdentifier_cdPtr: Field = 0x44;
global BasicOrder_considerationAmount_cdPtr: Field = 0x64;
global BasicOrder_offerer_cdPtr: Field = 0x84;
global BasicOrder_zone_cdPtr: Field = 0xa4;
global BasicOrder_offerToken_cdPtr: Field = 0xc4;
global BasicOrder_offerIdentifier_cdPtr: Field = 0xe4;
global BasicOrder_offerAmount_cdPtr: Field = 0x0104;
global BasicOrder_basicOrderType_cdPtr: Field = 0x0124;
global BasicOrder_startTime_cdPtr: Field = 0x0144;
global BasicOrder_endTime_cdPtr: Field = 0x0164;
// global BasicOrder_zoneHash_cdPtr: Field = 0x0184;
// global BasicOrder_salt_cdPtr: Field = 0x01a4;
global BasicOrder_offererConduit_cdPtr: Field = 0x01c4;
global BasicOrder_fulfillerConduit_cdPtr: Field = 0x01e4;
global BasicOrder_totalOriginalAdditionalRecipients_cdPtr: Field = 0x0204;
global BasicOrder_additionalRecipients_head_cdPtr: Field = 0x0224;
global BasicOrder_signature_cdPtr: Field = 0x0244;
global BasicOrder_additionalRecipients_length_cdPtr: Field = 0x0264;
global BasicOrder_additionalRecipients_data_cdPtr: Field = 0x0284;
global BasicOrder_parameters_ptr: Field = 0x20;
global BasicOrder_basicOrderType_range: Field = 0x18; // 24 values


//   Memory layout in _prepareBasicFulfillmentFromCalldata of
//   EIP712 data for ConsiderationItem
//    - 0x80: ConsiderationItem EIP-712 typehash (constant)
//    - 0xa0: itemType
//    - 0xc0: token
//    - 0xe0: identifier
//    - 0x100: startAmount
//    - 0x120: endAmount
//    - 0x140: recipient

global BasicOrder_considerationItem_typeHash_ptr: Field = 0x80; // memoryPtr
global BasicOrder_considerationItem_itemType_ptr: Field = 0xa0;
global BasicOrder_considerationItem_token_ptr: Field = 0xc0;
global BasicOrder_considerationItem_identifier_ptr: Field = 0xe0;
global BasicOrder_considerationItem_startAmount_ptr: Field = 0x0100;
global BasicOrder_considerationItem_endAmount_ptr: Field = 0x0120;
// global BasicOrder_considerationItem_recipient_ptr: Field = 0x0140;


//   Memory layout in _prepareBasicFulfillmentFromCalldata of
//   EIP712 data for OfferItem
//    - 0x80:  OfferItem EIP-712 typehash (constant)
//    - 0xa0:  itemType
//    - 0xc0:  token
//    - 0xe0:  identifier (reused for offeredItemsHash)
//    - 0x100: startAmount
//    - 0x120: endAmount

global BasicOrder_offerItem_typeHash_ptr: Field = 0x80;
global BasicOrder_offerItem_itemType_ptr: Field = 0xa0;
global BasicOrder_offerItem_token_ptr: Field = 0xc0;
// global BasicOrder_offerItem_identifier_ptr: Field = 0xe0;
// global BasicOrder_offerItem_startAmount_ptr: Field = 0x0100;
global BasicOrder_offerItem_endAmount_ptr: Field = 0x0120;


//   Memory layout in _prepareBasicFulfillmentFromCalldata of
//   EIP712 data for Order
//    - 0x80:   Order EIP-712 typehash (constant)
//    - 0xa0:   orderParameters.offerer
//    - 0xc0:   orderParameters.zone
//    - 0xe0:   keccak256(abi.encodePacked(offerHashes))
//    - 0x100:  keccak256(abi.encodePacked(considerationHashes))
//    - 0x120:  orderType
//    - 0x140:  startTime
//    - 0x160:  endTime
//    - 0x180:  zoneHash
//    - 0x1a0:  salt
//    - 0x1c0:  conduit
//    - 0x1e0:  _counters[orderParameters.offerer] (from storage)

global BasicOrder_order_typeHash_ptr: Field = 0x80;
global BasicOrder_order_offerer_ptr: Field = 0xa0;
// global BasicOrder_order_zone_ptr: Field = 0xc0;
global BasicOrder_order_offerHashes_ptr: Field = 0xe0;
global BasicOrder_order_considerationHashes_ptr: Field = 0x0100;
global BasicOrder_order_orderType_ptr: Field = 0x0120;
global BasicOrder_order_startTime_ptr: Field = 0x0140;
// global BasicOrder_order_endTime_ptr: Field = 0x0160;
// global BasicOrder_order_zoneHash_ptr: Field = 0x0180;
// global BasicOrder_order_salt_ptr: Field = 0x01a0;
// global BasicOrder_order_conduitKey_ptr: Field = 0x01c0;
global BasicOrder_order_counter_ptr: Field = 0x01e0;
global BasicOrder_additionalRecipients_head_ptr: Field = 0x0240;
global BasicOrder_signature_ptr: Field = 0x0260;
global BasicOrder_startTimeThroughZoneHash_size: Field = 0x60;

global ContractOrder_orderHash_offerer_shift: Field = 0x60;

global Counter_blockhash_shift: Field = 0x80;

// Signature-related
global EIP2098_allButHighestBitMask: [u8; 32] = [0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff];
global ECDSA_twentySeventhAndTwentyEighthBytesSet: [u8; 32] = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];
global ECDSA_MaxLength: Field = 65;
global ECDSA_signature_s_offset: Field = 0x40;
global ECDSA_signature_v_offset: Field = 0x60;

global EIP1271_isValidSignature_selector: [u8; 32] = [0x16, 0x22, 0xb6, 0x7b, 0x0a, 0x07, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];
global EIP1271_isValidSignature_digest_negativeOffset: Field = 0x40;
global EIP1271_isValidSignature_selector_negativeOffset: Field = 0x44;
global EIP1271_isValidSignature_calldata_baseLength: Field = 0x64;
global EIP1271_isValidSignature_signature_head_offset: Field = 0x40;

global EIP_712_PREFIX: Field = 0x1901000000000000000000000000000000000000000000000000000000000000;

global ExtraGasBuffer: Field = 0x20;
global CostPerWord: Field = 0x03;
global MemoryExpansionCoefficientShift: Field = 0x09;

global Create2AddressDerivation_ptr: Field = 0x0b;
global Create2AddressDerivation_length: Field = 0x55;

global MaskOverByteTwelve: Field = 0x0000000000000000000000ff0000000000000000000000000000000000000000;
global MaskOverLastTwentyBytes: Field = 0x000000000000000000000000ffffffffffffffffffffffffffffffffffffffff;
global AddressDirtyUpperBitThreshold: Field = 0x0000000000000000000000010000000000000000000000000000000000000000;
global MaskOverFirstFourBytes: Field = 0xffffffff00000000000000000000000000000000000000000000000000000000;

global Conduit_execute_signature: Field = 0x4ce34aa200000000000000000000000000000000000000000000000000000000;

global MaxUint8: Field = 0xff;
global MaxUint120: Field = 0xffffffffffffffffffffffffffffff;

global Conduit_execute_ConduitTransfer_ptr: Field = 0x20;
global Conduit_execute_ConduitTransfer_length: Field = 0x01;
global Conduit_execute_ConduitTransfer_offset_ptr: Field = 0x04;
global Conduit_execute_ConduitTransfer_length_ptr: Field = 0x24;
global Conduit_execute_transferItemType_ptr: Field = 0x44;
global Conduit_execute_transferToken_ptr: Field = 0x64;
global Conduit_execute_transferFrom_ptr: Field = 0x84;
global Conduit_execute_transferTo_ptr: Field = 0xa4;
global Conduit_execute_transferIdentifier_ptr: Field = 0xc4;
global Conduit_execute_transferAmount_ptr: Field = 0xe4;

global OneConduitExecute_size: Field = 0x0104;

// Sentinel value to indicate that the conduit accumulator is not armed.
global AccumulatorDisarmed: Field = 0x20;
global AccumulatorArmed: Field = 0x40;
global Accumulator_conduitKey_ptr: Field = 0x20;
global Accumulator_selector_ptr: Field = 0x40;
global Accumulator_array_offset_ptr: Field = 0x44;
global Accumulator_array_length_ptr: Field = 0x64;
global Accumulator_itemSizeOffsetDifference: Field = 0x3c;
global Accumulator_array_offset: Field = 0x20;

global Conduit_transferItem_size: Field = 0xc0;
global Conduit_transferItem_token_ptr: Field = 0x20;
global Conduit_transferItem_from_ptr: Field = 0x40;
global Conduit_transferItem_to_ptr: Field = 0x60;
global Conduit_transferItem_identifier_ptr: Field = 0x80;
global Conduit_transferItem_amount_ptr: Field = 0xa0;

global Ecrecover_precompile: Field = 0x01;
global Ecrecover_args_size: Field = 0x80;
global Signature_lower_v: Field = 27;

// Bitmask that only gives a non-zero value if masked with a non-match selector.
global NonMatchSelector_MagicMask: Field = 0x4000000000000000000000000000000000000000000000000000000000;

// First bit indicates that a NATIVE offer items has been used and the 231st bit
// indicates that a non match selector has been called.
global NonMatchSelector_InvalidErrorValue: Field = 0x4000000000000000000000000000000000000000000000000000000001;

//  @dev Selector and offsets for generateOrder
// 
//  function generateOrder(
//    address fulfiller,
//    SpentItem[] calldata minimumReceived,
//    SpentItem[] calldata maximumSpent,
//    bytes calldata context
//  )

global generateOrder_selector: Field = 0x98919765;
global generateOrder_selector_offset: Field = 0x1c;
global generateOrder_head_offset: Field = 0x04;
global generateOrder_minimumReceived_head_offset: Field = 0x20;
global generateOrder_maximumSpent_head_offset: Field = 0x40;
global generateOrder_context_head_offset: Field = 0x60;
global generateOrder_base_tail_offset: Field = 0x80;
global generateOrder_maximum_returndatasize: Field = 0xffff;

global ratifyOrder_selector: Field = 0xf4dd92ce;
global ratifyOrder_selector_offset: Field = 0x1c;
global ratifyOrder_head_offset: Field = 0x04;
// global ratifyOrder_offer_head_offset: Field = 0x00;
global ratifyOrder_consideration_head_offset: Field = 0x20;
global ratifyOrder_context_head_offset: Field = 0x40;
global ratifyOrder_orderHashes_head_offset: Field = 0x60;
global ratifyOrder_contractNonce_offset: Field = 0x80;
global ratifyOrder_base_tail_offset: Field = 0xa0;

global validateOrder_selector: Field = 0x17b1f942;
global validateOrder_selector_offset: Field = 0x1c;
global validateOrder_head_offset: Field = 0x04;
global validateOrder_zoneParameters_offset: Field = 0x20;

// global ZoneParameters_orderHash_offset: Field = 0x00;
global ZoneParameters_fulfiller_offset: Field = 0x20;
global ZoneParameters_offerer_offset: Field = 0x40;
global ZoneParameters_offer_head_offset: Field = 0x60;
global ZoneParameters_consideration_head_offset: Field = 0x80;
global ZoneParameters_extraData_head_offset: Field = 0xa0;
global ZoneParameters_orderHashes_head_offset: Field = 0xc0;
global ZoneParameters_startTime_offset: Field = 0xe0;
global ZoneParameters_endTime_offset: Field = 0x0100;
global ZoneParameters_zoneHash_offset: Field = 0x0120;
global ZoneParameters_base_tail_offset: Field = 0x0140;
global ZoneParameters_selectorAndPointer_length: Field = 0x24;
global ZoneParameters_basicOrderFixedElements_length: Field = 0x64;

// ConsiderationDecoder Constants
global OrderParameters_head_size: Field = 0x0160;
global OrderParameters_totalOriginalConsiderationItems_offset: Field = 0x0140;
global AdvancedOrderPlusOrderParameters_head_size: Field = 0x0200;

global Order_signature_offset: Field = 0x20;
global Order_head_size: Field = 0x40;

global AdvancedOrder_fixed_segment_0: Field = 0x40;

global CriteriaResolver_head_size: Field = 0xa0;
global CriteriaResolver_fixed_segment_0: Field = 0x80;
global CriteriaResolver_criteriaProof_offset: Field = 0x80;

global FulfillmentComponent_mem_tail_size: Field = 0x40;
global FulfillmentComponent_mem_tail_size_shift: Field = 0x06;
global Fulfillment_head_size: Field = 0x40;
global Fulfillment_considerationComponents_offset: Field = 0x20;

global OrderComponents_OrderParameters_common_head_size: Field = 0x0140;
