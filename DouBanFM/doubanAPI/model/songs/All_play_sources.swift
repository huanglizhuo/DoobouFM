/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct All_play_sources : Codable {
	let confidence : Double?
	let source_full_name : String?
	let file_url : String?
	let source : String?
	let source_id : String?
	let playable : Bool?
	let page_url : String?

	enum CodingKeys: String, CodingKey {

		case confidence = "confidence"
		case source_full_name = "source_full_name"
		case file_url = "file_url"
		case source = "source"
		case source_id = "source_id"
		case playable = "playable"
		case page_url = "page_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		confidence = try values.decodeIfPresent(Double.self, forKey: .confidence)
		source_full_name = try values.decodeIfPresent(String.self, forKey: .source_full_name)
		file_url = try values.decodeIfPresent(String.self, forKey: .file_url)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		source_id = try values.decodeIfPresent(String.self, forKey: .source_id)
		playable = try values.decodeIfPresent(Bool.self, forKey: .playable)
		page_url = try values.decodeIfPresent(String.self, forKey: .page_url)
	}

}
