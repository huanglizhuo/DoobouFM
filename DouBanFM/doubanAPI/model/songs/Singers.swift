/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Singers : Codable {
	let related_site_id : Int?
	let style : [String]?
	let name : String?
	let is_site_artist : Bool?
	let genre : [String]?
	let region : [String]?
	let name_usual : String?
	let id : String?
	let avatar : String?

	enum CodingKeys: String, CodingKey {

		case related_site_id = "related_site_id"
		case style = "style"
		case name = "name"
		case is_site_artist = "is_site_artist"
		case genre = "genre"
		case region = "region"
		case name_usual = "name_usual"
		case id = "id"
		case avatar = "avatar"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		related_site_id = try values.decodeIfPresent(Int.self, forKey: .related_site_id)
		style = try values.decodeIfPresent([String].self, forKey: .style)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		is_site_artist = try values.decodeIfPresent(Bool.self, forKey: .is_site_artist)
		genre = try values.decodeIfPresent([String].self, forKey: .genre)
		region = try values.decodeIfPresent([String].self, forKey: .region)
		name_usual = try values.decodeIfPresent(String.self, forKey: .name_usual)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
	}

}
