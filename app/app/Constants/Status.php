<?php

namespace App\Constants;

class Status
{

    const ENABLE = 1;
    const DISABLE = 0;

    const YES = 1;
    const NO = 0;

    const VERIFIED = 1;
    const UNVERIFIED = 0;

    const PAYMENT_INITIATE = 0;
    const PAYMENT_SUCCESS = 1;
    const PAYMENT_PENDING = 2;
    const PAYMENT_REJECT = 3;

    const TICKET_OPEN = 0;
    const TICKET_ANSWER = 1;
    const TICKET_REPLY = 2;
    const TICKET_CLOSE = 3;

    const PRIORITY_LOW = 1;
    const PRIORITY_MEDIUM = 2;
    const PRIORITY_HIGH = 3;

    const USER_ACTIVE = 1;
    const USER_BAN = 0;

    const KYC_UNVERIFIED = 0;
    const KYC_PENDING = 2;
    const KYC_VERIFIED = 1;

    //user role
    const CUSTOMER = 0;
    const FIELD_TECHNICIAN = 1;

    //admin role
    const ADMIN = 0;
    const SALES_TEAM = 1;
    const DISPATCH_TEAM = 2;

    //work order status
    const NEW = 7;
    const OPEN = 1;
    const DISPATCHED = 2;
    const ONSITE = 3;
    const INVOICED = 4;
    const ON_HOLD = 5;
    const CLOSED = 6;

    //invoice
    const UNPAID = 0;
    const PAID = 1;
    //work order Type
    const SERVICE = 1;
    const PROJECT = 2;
    const INSTALL = 3;
}
