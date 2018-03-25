/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Song : Codable {
	let all_play_sources : [All_play_sources]?
	let albumtitle : String?
	let url : String?
	let file_ext : String?
	let album : String?
	let ssid : String?
	let title : String?
	let sid : String?
	let sha256 : String?
	let status : Int?
	let picture : String?
	let update_time : Int?
	let alert_msg : String?
	let is_douban_playable : Bool?
	let public_time : String?
	let partner_sources : [String]?
	let singers : [Singers]?
	let like : Int?
	let artist : String?
	let is_royal : Bool?
	let subtype : String?
	let length : Int?
	let release : Release?
	let aid : String?
	let kbps : String?
	let available_formats : Available_formats?

	enum CodingKeys: String, CodingKey {

		case all_play_sources = "all_play_sources"
		case albumtitle = "albumtitle"
		case url = "url"
		case file_ext = "file_ext"
		case album = "album"
		case ssid = "ssid"
		case title = "title"
		case sid = "sid"
		case sha256 = "sha256"
		case status = "status"
		case picture = "picture"
		case update_time = "update_time"
		case alert_msg = "alert_msg"
		case is_douban_playable = "is_douban_playable"
		case public_time = "public_time"
		case partner_sources = "partner_sources"
		case singers = "singers"
		case like = "like"
		case artist = "artist"
		case is_royal = "is_royal"
		case subtype = "subtype"
		case length = "length"
		case release
		case aid = "aid"
		case kbps = "kbps"
		case available_formats
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		all_play_sources = try values.decodeIfPresent([All_play_sources].self, forKey: .all_play_sources)
		albumtitle = try values.decodeIfPresent(String.self, forKey: .albumtitle)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		file_ext = try values.decodeIfPresent(String.self, forKey: .file_ext)
		album = try values.decodeIfPresent(String.self, forKey: .album)
		ssid = try values.decodeIfPresent(String.self, forKey: .ssid)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		sid = try values.decodeIfPresent(String.self, forKey: .sid)
		sha256 = try values.decodeIfPresent(String.self, forKey: .sha256)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		picture = try values.decodeIfPresent(String.self, forKey: .picture)
		update_time = try values.decodeIfPresent(Int.self, forKey: .update_time)
		alert_msg = try values.decodeIfPresent(String.self, forKey: .alert_msg)
		is_douban_playable = try values.decodeIfPresent(Bool.self, forKey: .is_douban_playable)
		public_time = try values.decodeIfPresent(String.self, forKey: .public_time)
		partner_sources = try values.decodeIfPresent([String].self, forKey: .partner_sources)
		singers = try values.decodeIfPresent([Singers].self, forKey: .singers)
		like = try values.decodeIfPresent(Int.self, forKey: .like)
		artist = try values.decodeIfPresent(String.self, forKey: .artist)
		is_royal = try values.decodeIfPresent(Bool.self, forKey: .is_royal)
		subtype = try values.decodeIfPresent(String.self, forKey: .subtype)
		length = try values.decodeIfPresent(Int.self, forKey: .length)
		release = try Release(from: decoder)
		aid = try values.decodeIfPresent(String.self, forKey: .aid)
		kbps = try values.decodeIfPresent(String.self, forKey: .kbps)
		available_formats = try Available_formats(from: decoder)
	}

}
