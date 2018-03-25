/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Playlist_Base : Codable {
	let warning : String?
	let r : Int?
	let version_max : Int?
	let is_show_quick_start : Int?
	let song : [Song]?

	enum CodingKeys: String, CodingKey {

		case warning = "warning"
		case r = "r"
		case version_max = "version_max"
		case is_show_quick_start = "is_show_quick_start"
		case song = "song"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		warning = try values.decodeIfPresent(String.self, forKey: .warning)
		r = try values.decodeIfPresent(Int.self, forKey: .r)
		version_max = try values.decodeIfPresent(Int.self, forKey: .version_max)
		is_show_quick_start = try values.decodeIfPresent(Int.self, forKey: .is_show_quick_start)
		song = try values.decodeIfPresent([Song].self, forKey: .song)
	}

}
