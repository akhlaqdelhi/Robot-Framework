import json
import requests
from faker import Faker

global auth

try:
    from robot.api.deco import keyword
    from robot.libraries.BuiltIn import BuiltIn
    import robot.libraries.BuiltIn
    import robot.api.logger as logger

    ROBOT = False
except Exception:
    ROBOT = False

faker = Faker('en_IN')
company = faker.company()
email = faker.email()
name = faker.name()


@keyword("CRM_DC_EMI")
# def crm_dc_emi(url, sr_no, iso_time):
def crm_dc_emi():
    payload = json.dumps({
      "requestType": "Deployment",
      "requestFor": 1,
      "isExistingCustomer": "No",
      "legalName": company,
      "dbaName": company,
      "sourceOfQuery": 10,
      "leadExternalReferenceId": "L060o00LeadXrefId",
      "leadCategory": "HDFC",
      "onboardingDate": "123",
      "doingBusinessSince": "2005-12-01",
      "mcc": "5732",
      "posSold": 2,
      "softPosSold": 5,
      "paymentWebsite": [],
      "cseCase": {
        "externalRefId": "c000oCaseXrefid",
        "customerId": "CUST30",
        "navId": "PL2122SO10",
        "lmsMerchantId": "37",
        "nbsCustomerId": "319"
      },
      "taxInformation": {
        "companyPANCard": "ABEFS"+"R",
        "isRegisteredUnderGSTLaw": "Yes",
        "gstNumber": "19ABEFS"+"R1Z2",
        "gstStateCode": "DL"
      },
      "primaryAcquirerId": 3,
      "merchantBankDetails": {
        "accountType": 2,
        "bankExternalId": 18,
        "nameAsPerBankRecords": name,
        "bankAccountNumber": "5670200777",
        "ifscCode": "IOBA0000565",
        "city": "MIDNAPORE",
        "bankBranchCode": "0567",
        "bankBranchAddress": "MIDNAPORE",
        "settlementMode": "NEFT"
      },
      "kycStatus": "1",
      "userEmpId": "10575",
      "username": "anindya.mitra@pinelabs.com",
      "annualTurnover": 4500000,
      "premiseOwnershipType": 1,
      "businessOwnershipType": 2,
      "operatingPremiseType": 2,
      "entityType": 1,
      "corporateEmail": "dpdhar@gmail.com",
      "settlementCycle": 2,
      "authorizedSignatoryDetails": [],
      "vasBankAccountMapping": [

        {
          "vasId": 86,
          "merchantBankDetails": {
            "accountType": 1,
            "bankExternalId": 19,
            "nameAsPerBankRecords": "SUNNY Money",
            "bankAccountNumber": "056702000001",
            "ifscCode": "CARDSIN0008231",
            "city": "JAIPORE",
            "bankBranchCode": "1567",
            "bankBranchAddress": "MJAIPPORE",
            "settlementMode": "NEFT"
          }
        },
        {
          "vasId": 101,
          "merchantBankDetails": {
            "accountType": 2,
            "bankExternalId": 18,
            "nameAsPerBankRecords": "SUNNY",
            "bankAccountNumber": "05670200000",
            "ifscCode": "IOBA0000567",
            "city": "MIDNAPORE",
            "bankBranchCode": "0567",
            "bankBranchAddress": "MIDNAPORE",
            "settlementMode": "NEFT"
          }
        }
      ],
      "vasAcqMapping": [
        {
          "vasId": 86,
          "acquirerId": 3,
          "isAggregator": True,
          "quantity": 1,
          "settlementCycle": 2,
          "edcItemNumber": "ITEM000246",
          "downstreamPOSItemNumber": "ITEM000247"
        },
        {
          "vasId": 101,
          "acquirerId": None,
          "isAggregator": True,
          "quantity": 1,
          "settlementCycle": 1
        }

      ],
      "merchantTransactionLimit": {
        "dailyLimit": 100000,
        "weeklyLimit": 200000,
        "monthlyLimit": 300000
      },
      "contactPersonDetail": [
        {
          "type": 4,
          "contactPersonName": "DEBAPRASAD DHAR",
          "mobileNo": "9732008464",
          "phone": "9732008464",
          "email": "dpdhar@gmail.com",
          "designation": 2
        },
        {
          "type": 1,
          "contactPersonName": "DEBAPRASAD DHAR",
          "mobileNo": "9732008464",
          "phone": "9732008464",
          "email": "dpdhar@gmail.com",
          "designation": 2
        }
      ],
      "address": [
        {
          "type": 1,
          "addressLine1": "COLONELGOLA MIDNAPORE COLONELGOLA",
          "addressLine2": ".",
          "landmark": "KALI MANDIR",
          "state": "DL",
          "city": 10535,
          "zipcode": 110025,
          "country": "India"
        },
        {
          "type": 4,
          "addressLine1": "COLONELGOLA MIDNAPORE COLONELGOLA",
          "addressLine2": ".",
          "landmark": "KALI MANDIR",
          "state": "DL",
          "city": 10535,
          "zipcode": 110025,
          "country": "India"
        }
      ],
      "addressList": [
        {
          "type": 1,
          "addressLine1": "COLONELGOLA MIDNAPORE COLONELGOLA",
          "addressLine2": ".",
          "landmark": "KALI MANDIR",
          "state": "DL",
          "city": 10535,
          "zipcode": 110025,
          "country": "India"
        },
        {
          "type": 4,
          "addressLine1": "COLONELGOLA MIDNAPORE COLONELGOLA",
          "addressLine2": ".",
          "landmark": "KALI MANDIR",
          "state": "DL",
          "city": 10535,
          "zipcode": 110025,
          "country": "India"
        }
      ],
      "documentsDetails": [
        {
          "documentSubType": "NA",
          "documentType": "Purchase Order With MCC Code",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-07-05T18:17:45.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVua"
        },
        {
          "documentSubType": "NA",
          "documentType": "Offline Agreement",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:39:48.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVub"
        },
        {
          "documentSubType": "NA",
          "documentType": "ACH",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-07-06T15:46:30.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVuc"
        },
        {
          "documentSubType": "Payment Cheque",
          "documentType": "Payment",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:43:52.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVud"
        },
        {
          "documentSubType": "Cancelled Cheque",
          "documentType": "Cancelled Cheque",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:46:08.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVue"
        },
        {
          "documentSubType": "NA",
          "documentType": "Deposit Slip",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:46:51.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVuf"
        },
        {
          "documentSubType": "NA",
          "documentType": "Rs.100  Stamp Paper",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:47:19.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVug"
        },
        {
          "documentSubType": "PAN Card",
          "documentType": "Firm Pan Card",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:48:02.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVuh"
        },
        {
          "documentSubType": "Aadhaar card",
          "documentType": "Minimum two Partners ID Proof",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:49:12.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVui"
        },
        {
          "documentSubType": "Copy of service tax registration along-with PAN of Proprietor",
          "documentType": "Proof Of Address",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:50:27.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVuj"
        },
        {
          "documentSubType": "Sales Tax registration issued by the Sales Tax Authority",
          "documentType": "Firm Registration",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:51:30.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVuk"
        },
        {
          "documentSubType": "NA",
          "documentType": "Partnership Deed",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:52:25.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVul"
        },
        {
          "documentSubType": "NA",
          "documentType": "Linking Letter",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:53:02.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVum"
        },
        {
          "documentSubType": "NA",
          "documentType": "Display Board Photo And Stock Photo",
          "uploadedByName": "Anindya Mitra",
          "uploadedByEmail": "anindya.mitra@pinelabs.com",
          "uploadedDate": "2021-06-28T15:53:24.000Z",
          "documentRecordLink": "https://pinelabs.my.salesforce.com/a0w0o00000WqVun"
        }
      ],
      "mdrFee": [
        {
          "vasId": 86,
          "cardType": 1,
          "value": "1.7",
          "mdrRateType": 1,
          "acquirerId": 3,
          "posType": 1,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        },
        {
          "vasId": 86,
          "cardType": 2,
          "value": "[{\"slabList\":[{\"upperLimit\":200000,\"rateType\":1,\"rate\":0,\"lowerLimit\":0,\"annualTurnover\":[{\"upperLimitAmount\":200000000,\"rateType\":1,\"rate\":0,\"lowerLimitAmount\":0,\"capAmount\":0},{\"upperLimitAmount\":999999999999,\"rateType\":1,\"rate\":0,\"lowerLimitAmount\":200000001,\"capAmount\":0}]},{\"upperLimit\":999999999999,\"rateType\":1,\"rate\":0,\"lowerLimit\":200001,\"annualTurnover\":[{\"upperLimitAmount\":200000000,\"rateType\":1,\"rate\":0,\"lowerLimitAmount\":0,\"capAmount\":0},{\"upperLimitAmount\":999999999999,\"rateType\":1,\"rate\":0,\"lowerLimitAmount\":200000001,\"capAmount\":0}]}],\"mdrType\":4,\"cardNetwork\":\"RUPAY\"},{\"slabList\":[{\"upperLimit\":200000,\"rateType\":1,\"rate\":4000,\"lowerLimit\":0,\"annualTurnover\":[{\"upperLimitAmount\":200000000,\"rateType\":1,\"rate\":4000,\"lowerLimitAmount\":0,\"capAmount\":20000},{\"upperLimitAmount\":999999999999,\"rateType\":1,\"rate\":7000,\"lowerLimitAmount\":200000001,\"capAmount\":100000}]},{\"upperLimit\":9999999999,\"rateType\":1,\"rate\":4000,\"lowerLimit\":200001,\"annualTurnover\":[{\"upperLimitAmount\":200000000,\"rateType\":1,\"rate\":4000,\"lowerLimitAmount\":0,\"capAmount\":20000},{\"upperLimitAmount\":999999999999,\"rateType\":1,\"rate\":9000,\"lowerLimitAmount\":200000001,\"capAmount\":100000}]}],\"mdrType\":4,\"cardNetwork\":\"OTHERS\"}]",
          "mdrRateType": 6,
          "acquirerId": 3,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        },
        {
          "vasId": 86,
          "cardType": 5,
          "value": "2.75",
          "mdrRateType": 1,
          "acquirerId": 3,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        },
        {
          "vasId": 101,
          "issuerId": 3,
          "value": "1.37",
          "mdrRateType": 1,
          "acquirerId": 3,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        },
        {
          "vasId": 101,
          "issuerId": -1,
          "value": "1.00",
          "mdrRateType": 1,
          "acquirerId": 3,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        },
        {
          "vasId": 101,
          "issuerId": 1,
          "value": "1.10",
          "mdrRateType": 1,
          "acquirerId": 3,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        },
        {
          "vasId": 101,
          "issuerId": 4,
          "value": "1.40",
          "mdrRateType": 1,
          "acquirerId": 3,
          "serviceFee": {
            "mapleFeeType": 1,
            "nonMapleFeeType": 1
          }
        }
      ]
    })
    # headers = {
    #   'Content-Type': 'application/json'
    # }
    #
    # response = requests.request("POST", url, headers=headers, data=payload)
    # print(response.json())
    return payload
