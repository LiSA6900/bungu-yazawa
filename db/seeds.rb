# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
    email: 'kanri@test.com',
    password: 'kanrikanri',
    schedule_id: 1,
)

customers = Customer.create!(
 [
  {last_name:'山口', first_name:'健太', last_name_kana:'ヤマグチ', first_name_kana:'ケンタ', postal_code:'7685748', address:'埼玉県さいたま市西区飯田390', telephone_number:'08036454646', email:'kenta@test.com', password:'Kenta1'},
  {last_name:'鈴木', first_name:'明穂', last_name_kana:'スズキ', first_name_kana:'アキホ', postal_code:'3827364', address:'神奈川県横浜市泉区緑園87-9', telephone_number:'08063748573', email:'akiho@test.com', password:'Akiho1'},
  {last_name:'香川', first_name:'嘉伸', last_name_kana:'カガワ', first_name_kana:'ヨシノブ', postal_code:'7464499', address:'静岡県静岡市葵区一番町3-2', telephone_number:'08025364758', email:'yoshinobu@test.com', password:'Yoshinobu'},
  {last_name:'高本', first_name:'美月', last_name_kana:'タカモト', first_name_kana:'ミズキ', postal_code:'1437768', address:'静岡県静岡市清水区青葉町88-6', telephone_number:'08063547382', email:'mizuki@test.com', password:'Mizuki'},
  {last_name:'内山', first_name:'遙', last_name_kana:'ウチヤマ', first_name_kana:'ハルカ', postal_code:'3246776', address:'静岡県熱海市泉875-8', telephone_number:'08064468879', email:'haruka@test.com', password:'Haruka'},
  {last_name:'岩本', first_name:'拓真', last_name_kana:'イワモト', first_name_kana:'タクマ', postal_code:'1325578', address:'千葉県旭市秋田790', telephone_number:'08065443567', email:'takuma@test.com', password:'Takuma'},
  {last_name:'鈴本', first_name:'美希', last_name_kana:'スズキ', first_name_kana:'ミキ', postal_code:'6475590', address:'神奈川県厚木市愛名34-7', telephone_number:'08076576821', email:'miki@test.com', password:'Miki11'},
  {last_name:'渡辺', first_name:'光生', last_name_kana:'ワタナベ', first_name_kana:'コウキ', postal_code:'7599089', address:'静岡県沼津市岡一色79', telephone_number:'08037121146', email:'kouki@test.com', password:'Kouki1'},
  {last_name:'石川', first_name:'昭信', last_name_kana:'イシカワ', first_name_kana:'アキノブ', postal_code:'4226477', address:'静岡県静岡市駿河区青木3302', telephone_number:'08017443528', email:'akinobu@test.com', password:'Akinobu'},
  {last_name:'山田', first_name:'正明', last_name_kana:'ヤマダ', first_name_kana:'マサアキ', postal_code:'3246648', address:'神奈川県秦野市桜町44-5', telephone_number:'08065773512', email:'masaaki@test.com', password:'Masaaki'},
  {last_name:'五十嵐', first_name:'優', last_name_kana:'イガラシ', first_name_kana:'ユウ', postal_code:'1336531', address:'岐阜県関市岩本95', telephone_number:'08067558765', email:'yuu@test.com', password:'Yuu111'},
  {last_name:'佐久間', first_name:'連', last_name_kana:'サクマ', first_name_kana:'レン', postal_code:'2535656', address:'岐阜県本巣市石原11-579', telephone_number:'08033759967', email:'ren@test.com', password:'Ren111'},
  {last_name:'田島', first_name:'裕貴', last_name_kana:'タジマ', first_name_kana:'ユウキ', postal_code:'1456577', address:'神奈川県海老名市泉1-41', telephone_number:'08037553375', email:'yuuki@test.com', password:'Yuuki1'},
  {last_name:'秋山', first_name:'南', last_name_kana:'アキヤマ', first_name_kana:'ミナミ', postal_code:'2615649', address:'埼玉県春日部市梅田5-79', telephone_number:'08044755331', email:'minami@test.com', password:'Minami'},
  {last_name:'桐谷', first_name:'快斗', last_name_kana:'キリタニ', first_name_kana:'カイト', postal_code:'4253445', address:'千葉県柏市青葉台1-66', telephone_number:'08012555640', email:'kaito@test.com', password:'Kaito1'},
  {last_name:'三浦', first_name:'翔太', last_name_kana:'ミウラ', first_name_kana:'ショウタ', postal_code:'4145524', address:'埼玉県川口市石神8888', telephone_number:'08055543327', email:'syouta@test.com', password:'Syouta'},
  {last_name:'山中', first_name:'将生', last_name_kana:'ヤマナカ', first_name_kana:'マサキ', postal_code:'6425134', address:'神奈川県鎌倉市岩瀬80', telephone_number:'08051547678', email:'masaki@test.com', password:'Masaki'},
  {last_name:'中村', first_name:'亜美', last_name_kana:'ナカムラ', first_name_kana:'アミ', postal_code:'5335241', address:'千葉県木更津市吾妻689', telephone_number:'0557448800', email:'ami@test.com', password:'Ami111'},
  {last_name:'勝又', first_name:'明日奈', last_name_kana:'カツマタ', first_name_kana:'アスナ', postal_code:'8795774', address:'埼玉県行田市忍6580', telephone_number:'09044275866', email:'asuna@test.com', password:'Asuna1'},
  {last_name:'長田', first_name:'幸', last_name_kana:'オサダ', first_name_kana:'サチ', postal_code:'4837584', address:'埼玉県草加市稲荷3-394', telephone_number:'0804727577', email:'sachi@test.com', password:'Sachi1'},
 ]
)