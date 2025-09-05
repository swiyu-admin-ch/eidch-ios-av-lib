import Foundation

public enum AVBeamContentField: Int, CaseIterable {
  // MRZ Fields
  case mrzType = 40
  case mrzSubtype = 41
  case mrzIssuingState = 42
  case mrzLastname = 43
  case mrzFirstnames = 44
  case mrzNameTruncationIndicator = 45
  case mrzDocumentNumber = 46
  case mrzDocumentNumberCheckDigit = 47
  case mrzNationality = 48
  case mrzDateOfBirth = 49
  case mrzDateOfBirthCheckDigit = 50
  case mrzGender = 51
  case mrzExpiryDate = 52
  case mrzExpiryDateCheckDigit = 53
  case mrzOptionalData = 54
  case mrzOptionalData2 = 55
  case mrzOverallCheckDigit = 56
  case mrzTd2CheckDigit = 57
  case mrzTd1CheckDigit = 58
  case mrzData = 59
  case mrzZemis = 60
  case mrzOcr = 61
  case mrzCardIssued = 62
  case mrzFuar = 63
  case mrzLine1 = 64
  case mrzLine2 = 65
  case mrzLine3 = 66
  case mrzIssuerName = 67
  case mrzFathersName = 68

  // Optional Names
  case optionalLastNames = 80
  case optionalFirstNames = 81

  // Liveness Check
  case livenessCheckTransactionCode = 89
  case livenessCheckResult = 90
  case livenessCheckErrorID = 91
  case livenessCheckThreshold = 92
  case livenessCheckConfidenceLevel = 93
  case livenessCheckProcessId = 94
  case livenessCheckFSTID = 95
  case livenessCheckBlurThreshold = 96
  case livenessCheckBlurCheckImage1 = 97

  // Face Verification
  case faceVerificationResult = 98
  case faceVerificationErrorID = 99
  case faceVerificationThreshold = 100
  case faceVerificationConfidenceLevel = 101
  case faceVerificationProcessId = 102
  case faceVerificationFSTID = 103
  case faceVerificationBlurThreshold = 104
  case faceVerificationBlurCheckImage1 = 105
  case faceVerificationBlurCheckImage2 = 106
  case faceVerificationTransactionCode = 107

  // VIZ Fields
  case vizMarriedName = 108
  case vizMaidenname = 109
  case vizType = 110
  case vizSubtype = 111
  case vizIssuingState = 112
  case vizLastname = 113
  case vizFirstnames = 114
  case vizDocumentNumber = 115
  case vizNationality = 116
  case vizDateOfBirth = 117
  case vizGender = 118
  case vizExpiryDate = 119
  case vizOptionalData = 120
  case vizOptionalData2 = 121
  case vizEmploymentStatus = 122

  // Metadata
  case mdEditedFirstName = 123
  case mdEditedLastName = 124
  case mdGeneratedMrz = 125
  case mdConfidenceLevel = 126
  case mdScanDate = 127
  case mdScanMouseId = 128
  case mdVersionId = 129
  case mdChecksum = 130
  case mdCustomerConfirmWrongData = 131
  case mdPhoneId = 132
  case mdDeviceModelType = 133
  case mdOsVersion = 134
  case mdStatusType = 135 // DEPRECATED
  case mdErrorID = 136
  case mdState = 137 // DEPRECATED
  case mdRequestId = 138
  case mdReportVersion = 139
  case mdScanEngineVersion = 140 // DEPRECATED
  case mdVendorName = 141
  case mdAppName = 142

  // Additional VIZ Fields
  case vizAddress = 143
  case vizElectionCode = 144
  case vizCurp = 145
  case vizDateOfIssue = 146
  case mdSelfieStatus = 147
  case mdOrderId = 148
  case vizZemis = 149
  case vizPlaceOfBirth = 150
  case vizAuthority = 151
  case vizDrivingCategory = 152
  case vizSignature = 153
  case vizDrivingCategoryValue = 154
  case vizDrivingCategoryIssueDate = 155
  case vizDrivingCategoryExpiryDate = 156
  case vizDrivingCategoryRestriction = 157
  case vizOverallDrivingRestriction = 158
  case vizFacePosition = 159

  // Check Fields
  case mdCheckDOB = 160 // NOT USED
  case mdCheckDocNumber = 161 // NOT USED
  case mdCheckFirstNameMRZvsVIZ = 162
  case mdCheckLastNameMRZvsVIZ = 163
  case mdCheckFirstNameMRZvsNFC = 164
  case mdCheckLastNameMRZvsNFC = 165
  case mdCheckDOBMRZvsVIZ = 166
  case mdCheckDocNumberMRZvsVIZ = 167
  case mdCheckDOBMRZvsNFC = 168
  case mdCheckDocNumberMRZvsNFC = 169
  case mdPermitFormat = 170
  case mdNFCErrorID = 171

  // Additional VIZ Information
  case vizAdditionalAddressInformation = 172
  case vizAdditionalNameInformation = 173
  case vizAdditionalPersonalIdNumber = 174
  case vizDocumentAdditionalNumber = 175
  case vizDocumentAdditionalNumber2 = 176
  case vizEmployer = 177
  case vizFullname = 178
  case vizIssuingAuthority = 179
  case vizMaritalStatus = 180
  case vizPersonalIdNumber = 181
  case vizProfession = 182
  case vizRace = 183
  case vizReligion = 184
  case vizResidentialStatus = 185
  case vizRestrictions = 186
  case vizVehicleClass = 187

  // Additional Metadata
  case mdExtractedExpiryDate = 188
  case mdAllowUseDataForML = 189
  case vizFullName = 190
  case vizFathersName = 191

  // Security Features
  case sfHologramResult = 200
  case sfHologramConfidenceLevel = 201
  case sfHologramThreshold = 202
  case sfLenticularResult = 203
  case sfLenticularConfidenceLevel = 204
  case sfLenticularThreshold = 205
  case sfLenticularDocumentNumber = 206
  case sfLenticularExpiryYear = 207
  case sfDocumentManipulationResult = 208
  case sfDocumentManipulationConfidenceLevel = 209
  case sfDocumentManipulationThreshold = 210

  // Barcode vs VIZ Checks
  case mdCheckFirstNameBarcodeVsVIZ = 211
  case mdCheckLastNameBarcodeVsVIZ = 212
  case mdCheckDOBBarcodeVsVIZ = 213
  case mdCheckDocNumberBarcodeVsVIZ = 214

  // Additional Metadata
  case mdErrorCodeList = 300
  case mdApplicationId = 301
  case mdBrandId = 302
  case mdFSTID = 303
  case mdTransactionCode = 304

  // Document Classification
  case dcClassifiedDocumentFirstScan = 400
  case dcClassifiedDocumentSecondScan = 401

  // Process ID
  case processId = 500

  // Auxiliary
  case auxIDLanguage = 600
  case auxPermitType = 601

  // NFC Fields
  case nfcSecondaryIdentifier = 700
  case nfcPrimaryIdentifier = 701
  case nfcDateOfBirth = 702
  case nfcDocumentCode = 703
  case nfcDocumentNumber = 704
  case nfcIssuingState = 705
  case nfcNationality = 706
  case nfcGender = 707
  case nfcDateOfExpiry = 708
  case nfcDocumentNumberCheckDigit = 709
  case nfcDateOfBirthCheckDigit = 710
  case nfcDateOfExpiryCheckDigit = 711
  case nfcCompositeCheckDigit = 712
  case nfcOptionalData1 = 713
  case nfcOptionalData2 = 714

  // NFC Certificate Validation
  case nfcCertificateValidationResult = 715
  case nfcCertificateValidationErrorID = 716
  case nfcCertificateValidationProcessId = 717
  case nfcCertificateValidationFSTID = 718
  case nfcCertificateValidationTransactionCode = 719
  case nfcProcessId = 720
  case nfcFSTID = 721
  case nfcTransactionCode = 722

  // NFC Document Verification
  case nfcDocumentVerificationHashAlgorithm = 749
  case nfcDocumentVerificationDg1 = 750
  case nfcDocumentVerificationDg2 = 751
  case nfcDocumentVerificationDg3 = 752
  case nfcDocumentVerificationDg4 = 753
  case nfcDocumentVerificationDg5 = 754
  case nfcDocumentVerificationDg6 = 755
  case nfcDocumentVerificationDg7 = 756
  case nfcDocumentVerificationDg8 = 757
  case nfcDocumentVerificationDg9 = 758
  case nfcDocumentVerificationDg10 = 759
  case nfcDocumentVerificationDg11 = 760
  case nfcDocumentVerificationDg12 = 761
  case nfcDocumentVerificationDg13 = 762
  case nfcDocumentVerificationDg14 = 763
  case nfcDocumentVerificationDg15 = 764
  case nfcDocumentVerificationDg16 = 765
  case nfcDocumentVerificationMrzFormat = 766
  case nfcDocumentVerificationDocumentType = 767
  case nfcDocumentVerificationDocumentCountry = 768
  case nfcDocumentVerificationLastName = 769
  case nfcDocumentVerificationFirstName = 770
  case nfcDocumentVerificationNationality = 771
  case nfcDocumentVerificationDocumentNumber = 772
  case nfcDocumentVerificationDateOfBirth = 773
  case nfcDocumentVerificationGender = 774
  case nfcDocumentVerificationDateOfExpiry = 775
  case nfcDocumentVerificationOptionalData1 = 776
  case nfcDocumentVerificationOptionalData2 = 777
  case nfcDocumentVerificationFullNameOfHolder = 778
  case nfcDocumentVerificationOtherNames = 779
  case nfcDocumentVerificationPersonalNumber = 780
  case nfcDocumentVerificationFullDateOfBirth = 781
  case nfcDocumentVerificationPlaceOfBirth = 782
  case nfcDocumentVerificationPermanentAddress = 783
  case nfcDocumentVerificationTelephone = 784
  case nfcDocumentVerificationProfession = 785
  case nfcDocumentVerificationPersonalSummary = 786
  case nfcDocumentVerificationProofOfCitizenshipImage = 787
  case nfcDocumentVerificationOtherValidTravelDocumentNumbers = 788
  case nfcDocumentVerificationCustodyInformation = 789
  case nfcDocumentVerificationIssuingAuthority = 790
  case nfcDocumentVerificationDateOfIssue = 791
  case nfcDocumentVerificationNamesOfOtherPersons = 792
  case nfcDocumentVerificationEndorsementsAndObservations = 793
  case nfcDocumentVerificationTaxOrExitRequirements = 794
  case nfcDocumentVerificationImageOfFront = 795
  case nfcDocumentVerificationImageOfRear = 796
  case nfcDocumentVerificationDateAndTimeOfPersonalization = 797
  case nfcDocumentVerificationPersonalizationSystemSerialNumber = 798
  case nfcDocumentVerificationPassiveAuthentication = 799
  case nfcDocumentVerificationSodSignatureValid = 800
  case nfcDocumentVerificationDocumentCertificateValid = 801
  case nfcDocumentVerificationDataGroupsChecked = 802
  case nfcDocumentVerificationDataGroupsWithValidHash = 803
  case nfcDocumentVerificationError = 804
  case nfcDocumentVerificationAllHashesValid = 805
  case nfcDocumentVerificationErrors = 806
  case nfcCertificateValidationIdb = 807
  case nfcDocumentVerificationTitle = 808
  case nfcActiveAuthenticationResult = 810
  case nfcChipAuthenticationResult = 811
  case nfcActiveAuthenticationProcessId = 812
  case nfcActiveAuthenticationFSTID = 813
  case nfcActiveAuthenticationTransactionCode = 814
  case nfcChipAuthenticationProcessId = 815
  case nfcChipAuthenticationFSTID = 816
  case nfcChipAuthenticationTransactionCode = 817
  case nfcDocumentVerificationZemisNumber = 818

  // Barcode Fields
  case barcodeData = 870
  case barcodeFirstname = 871
  case barcodeLastname = 872
  case barcodeDateOfBirth = 873
  case barcodeDateOfIssue = 874
  case barcodeDocumentType = 875
  case barcodeDocumentNumber = 876
  case barcodeNationality = 877
  case barcodeGender = 878
  case barcodeExpiryDate = 879
  case barcodeIssuingState = 880
  case barcodeDriverLicenseDetailedInfo = 881
  case barcodeAdditionalAddressInformation = 882
  case barcodeAdditionalNameInformation = 883
  case barcodeAdditionalPersonalIdNumber = 884
  case barcodeAddress = 885
  case barcodeDocumentAdditionalNumber = 886
  case barcodeEmployer = 887
  case barcodeFullname = 888
  case barcodeMaritalStatus = 889
  case barcodePlaceOfBirth = 890
  case barcodeProfession = 891
  case barcodeRace = 892
  case barcodeReligion = 893
  case barcodeResidentialStatus = 894
  case barcodeVehicleClass = 895
  case barcodeCheckFirstNameBARCODEvsVIZ = 896
  case barcodeCheckLastNameBARCODEvsVIZ = 897
  case barcodeCheckDOBBARCODEvsVIZ = 989
  case barcodeCheckDocNumberBARCODEvsVIZ = 899
  case barcodeRestrictions = 914
  case barcodeEndorsements = 915
  case vizEndorsements = 916

  // Unknown
  case unknown = 1000

  // MARK: Lifecycle

  init?(_ value: Int) {
    self.init(rawValue: value)
  }
}
