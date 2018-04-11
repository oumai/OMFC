//
//  PharmacyOrderListModel.h
//  KMTestHalthyManage
//
//  Created by woaiqiu947 on 2017/10/25.
//  Copyright © 2017年 woaiqiu947. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "OTCDrugData.h"

//@class OTCDrugListData;
//@interface PharmacyOrderListModel : NSObject
//@property (nonatomic, assign) NSInteger    ResultCode;
//
//@property (nonatomic, assign) NSInteger    RecordsCount;
//
//@property (nonatomic, copy  ) NSString     *ResultMessage;
//
//@property (nonatomic, assign) NSInteger    PageIndex;
//
//@property (nonatomic, assign) NSInteger    PageSize;
//
//@property (nonatomic, strong) NSArray <OTCDrugListData*> *Data;
//@end
//
//@interface OTCDrugListData : NSObject
//
//@property (nonatomic, copy  ) NSString     *OrderNo;
//
//@property (nonatomic, assign) NSInteger    OrderStatus;
//
//@property (nonatomic, copy  ) NSString     *FetchCode;
//
//@property (nonatomic, copy  ) NSString     *CreatedTime;
//
//@property (nonatomic, strong) NSArray <OTCDrugData*> *ProductList;

@class OTCDrugListData;
@interface PharmacyOrderListModel : NSObject


@property (nonatomic, assign) NSInteger RecordsCount;
@property (nonatomic, assign) NSInteger PageIndex;
@property (nonatomic, assign) NSInteger PageSize;
@property (nonatomic, assign) NSInteger ResultCode;
@property (nonatomic, strong) NSString *ResultMessage;
@property (nonatomic, strong) NSArray <OTCDrugListData*> *Data;

@end

@interface OTCDrugListData : NSObject

@property (nonatomic, assign) NSInteger PayMethod;
@property (nonatomic, assign) NSInteger OrderStatus;
@property (nonatomic, assign) NSInteger OrderType;
@property (nonatomic, assign) NSInteger ReceiveMethod;
@property (nonatomic, strong) NSString *ResultMessage;
@property (nonatomic, strong) NSString *AccountMobile;
@property (nonatomic, strong) NSString *OrderNo;
@property (nonatomic, strong) NSString *PayMethodVal;
@property (nonatomic, strong) NSString *OrderPayTime;
@property (nonatomic, strong) NSString *Address;
@property (nonatomic, strong) NSString *CreatedTime;
@property (nonatomic, strong) NSString *FetchCode;
@property (nonatomic, strong) NSString *FetchTime;
@property (nonatomic, strong) NSString *DrugStoreID;
@property (nonatomic, strong) NSString *MemberID;
@property (nonatomic, strong) NSString *RecipeID;
@property (nonatomic, strong) NSString *RecipeFileUrl;
@property (nonatomic, strong) NSString *Symptom;
@property (nonatomic, strong) NSString *Freight;
@property (nonatomic, strong) NSString *OrderMoney;
@property (nonatomic, strong) NSString *Receiver;
@property (nonatomic, strong) NSString *ReceiverMobile;
@property (nonatomic, strong) NSString *ReceiverAddress;
@property (nonatomic, strong) NSArray<OTCDrugData *> *ProductList;
@end



