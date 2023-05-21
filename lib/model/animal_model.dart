class AnimalModel {
  int id /* 流水編號 */;

  String subId /* 區域編號 */;

  int areaId /* 所屬縣市代碼 */;

  int shelterId /* 所屬收容所代碼 */;

  String? place /* 實際所在地 */;

  String? kind /* 動物的類型 */;

  String? sex /* 性別[M | F | N]（公、母、未輸入） */;

  String? bodyType /* 體型 [SMALL | MEDIUM | BIG](小型、中型、大型) */;

  String? color /* 毛色 */;

  String? age /* 年紀[CHILD | ADULT]（幼年、成年） */;

  String sterilization /* 絕育狀況[T | F | N]（是、否、未輸入） */;

  String bacterin /* 狂犬疫苗狀況[T | F | N]（是、否、未輸入） */;

  String? foundPlace /* 尋獲地 */;

  String? title /* 網頁標題-幾乎沒用 */;

  String
      status /* 動物狀態[NONE | OPEN | ADOPTED | OTHER | DEAD]（未公告、開放認養、已認養、其他、死亡） */;

  String? remark /* 資料備註（文字敘述） */;

  String? caption /* 其他說明-後台用？ */;

  String? openDate /* 開放認養時間(起) */;

  String? closeDate /* 開放認養時間(迄) */;

  String? update /* 動物資料異動時間 */;

  String? createTime /* 動物資料建立時間 */;

  String? name /* 收容所名稱 */;

  String? imageUrl /* 圖片網址 */;

  String? imageUpdate /* 圖片異動時間 */;

  String? cDate /* 資料更新時間 */;

  String? address /* 收容所地址 */;

  String? tel /* 聯絡電話 */;

  String? variety /* 動物品種 */;

  AnimalModel({
    this.id = 0,
    this.subId = "",
    this.areaId = 0,
    this.shelterId = 0,
    this.place = "",
    this.kind = "",
    this.sex = "",
    this.bodyType = "",
    this.color = "",
    this.age = "",
    this.sterilization = "",
    this.bacterin = "",
    this.foundPlace = "",
    this.title = "",
    this.status = "",
    this.remark = "",
    this.caption = "",
    this.openDate = "",
    this.closeDate = "",
    this.update = "",
    this.createTime = "",
    this.name = "",
    this.imageUrl = "",
    this.imageUpdate = "",
    this.cDate = "",
    this.address = "",
    this.tel = "",
    this.variety = "",
  });

  AnimalModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['animal_id'],
        subId = json['animal_subid'],
        areaId = json['animal_area_pkid'],
        shelterId = json['animal_shelter_pkid'],
        place = json['animal_place'],
        kind = json['animal_kind'],
        sex = json['animal_sex'],
        bodyType = json['animal_bodytype'],
        color = json['animal_colour'],
        age = json['animal_age'],
        sterilization = json['animal_sterilization'],
        bacterin = json['animal_bacterin'],
        foundPlace = json['animal_foundplace'],
        title = json['animal_title'],
        status = json['animal_status'],
        remark = json['animal_remark'],
        caption = json['animal_caption'],
        openDate = json['animal_opendate'],
        closeDate = json['animal_closeddate'],
        update = json['animal_update'],
        createTime = json['animal_createtime'],
        name = json['shelter_name'],
        imageUrl = json['album_file'],
        imageUpdate = json['album_update'],
        cDate = json['cDate'],
        address = json['shelter_address'],
        tel = json['shelter_tel'],
        variety = json['animal_Variety'];

  Map<String, dynamic> toJson() => {
        'animal_id': id,
        "animal_subid": subId,
        "animal_area_pkid": areaId,
        "animal_shelter_pkid": shelterId,
        "animal_place": place,
        "animal_kind": kind,
        "animal_sex": sex,
        "animal_bodytype": bodyType,
        "animal_colour": color,
        "animal_age": age,
        "animal_sterilization": sterilization,
        "animal_bacterin": bacterin,
        "animal_foundplace": foundPlace,
        "animal_title": title,
        "animal_status": status,
        "animal_remark": remark,
        "animal_caption": caption,
        "animal_opendate": openDate,
        "animal_closeddate": closeDate,
        "animal_update": update,
        "animal_createtime": createTime,
        "shelter_name": name,
        "album_file": imageUrl,
        "album_update": imageUpdate,
        "cDate": cDate,
        "shelter_address": address,
        "shelter_tel": tel,
        "animal_Variety": variety,
      };
}
