class Account {
  String? odataEtag;
  String? accountnumber;
  int? statecode;
  String? emailaddress1;
  String? name;
  String? address1Country;
  String? address1Stateorprovince;
  String? address1Composite;
  String? websiteurl;
  String? entityimageUrl;
  String? address1City;
  String? address1Line1;
  String? address1Postalcode;
  String? accountid;

  Account(
      {this.odataEtag,
      this.accountnumber,
      this.statecode,
      this.emailaddress1,
      this.name,
      this.address1Country,
      this.address1Stateorprovince,
      this.address1Composite,
      this.websiteurl,
      this.entityimageUrl,
      this.address1City,
      this.address1Line1,
      this.address1Postalcode,
      this.accountid});

  Account.fromJson(Map<String, dynamic> json) {
    //odataEtag = json['odataetag'];
    accountnumber = json['accountnumber'];
    statecode = json['statecode'];
    emailaddress1 = json['emailaddress1'];
    name = json['name'];
    address1Country = json['address1_country'];
    address1Stateorprovince = json['address1_stateorprovince'];
    address1Composite = json['address1_composite'];
    websiteurl = json['websiteurl'];
    entityimageUrl = json['entityimage_url'];
    address1City = json['address1_city'];
    address1Line1 = json['address1_line1'];
    address1Postalcode = json['address1_postalcode'];
    accountid = json['accountid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['odataetag'] = this.odataEtag;
    data['accountnumber'] = this.accountnumber;
    data['statecode'] = this.statecode;
    data['emailaddress1'] = this.emailaddress1;
    data['name'] = this.name;
    data['address1_country'] = this.address1Country;
    data['address1_stateorprovince'] = this.address1Stateorprovince;
    data['address1_composite'] = this.address1Composite;
    data['websiteurl'] = this.websiteurl;
    data['entityimage_url'] = this.entityimageUrl;
    data['address1_city'] = this.address1City;
    data['address1_line1'] = this.address1Line1;
    data['address1_postalcode'] = this.address1Postalcode;
    data['accountid'] = this.accountid;
    return data;
  }
}
