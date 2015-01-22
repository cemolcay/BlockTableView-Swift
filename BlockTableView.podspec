#
#  Be sure to run `pod spec lint BlockTableView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "BlockTableView"
  s.version      = "0.1"
  s.summary      = "single line UITableView creation in Swift with power of the closures"

  s.description  = <<-DESC
  BlockTableView-Swift
  ====================

  single line UITableView creation in Swift with power of the closures

  Usage
  -----

  Copy & paste `BlockTableView.swift` into your project. <br>

  let table = BlockTableView (frame: self.view.frame,
  numberOfRowsInSection: { (section) -> Int in
    return dataSource.count
  },
  cellForRowAtIndexPath: { (tableView, indexPath) -> UITableViewCell in
    var cell = UITableViewCell (style: .Default, reuseIdentifier: "Identifer")

    let current = dataSource[indexPath.row]
    cell.textLabel.text = current

    return cell
  },
  didSelectRowAtIndexPath: { (tableView, indexPath) -> () in
    let selected = dataSource[indexPath.row]
    println("\(selected) selected")

    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  )


  Initilizers
  --------------

  convenience init(frame: CGRect,
  numberOfRowsInSection   : (section: Int) -> Int,
  cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
  didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())

  convenience init(frame: CGRect,
  numberOfSections        : Int,
  titleForHeaderInSection : (section: Int) -> String,
  numberOfRowsInSection   : (section: Int) -> Int,
  cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
  didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())

  convenience init(frame: CGRect,
  registeredCells         : [String: AnyClass],
  numberOfRowsInSection   : (section: Int) -> Int,
  cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
  didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())

  init(frame: CGRect,
  registeredCells         : [String: AnyClass]?,
  numberOfSections        : Int?,
  titleForHeaderInSection : ((section: Int) -> String)?,
  numberOfRowsInSection   : (section: Int) -> Int,
  cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
  didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())


  * You can easily add more initilizers with more `UITableViewDelegate`/`UITableViewDataSource` methods


  Search Bar
  ----------

  Search bar implementation never been easier

  func addSearchBar (searchResultTableView tableView: BlockTableView,  didSearch: (String)->())

  Just create another `BlockTableView` for displaying results and implement the filtering or searching function in didSearch, like

  var filtered: [String]! // search result dataSource

  table.addSearchBar(searchResultTableView:
  BlockTableView (frame: self.view.frame,
  numberOfRowsInSection: { (section) -> Int in
    return filtered.count
  },
  cellForRowAtIndexPath: { (tableView, indexPath) -> UITableViewCell in
    var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel?.text = filtered[indexPath.row]
    return cell
  },
  didSelectRowAtIndexPath: { (tableView, indexPath) -> () in
    return
  }
  ), didSearch: { searchText in
    filtered = filter (dataSource) { $0.rangeOfString(searchText) != nil }
  }
  )

  DESC

  s.homepage     = "https://github.com/cemolcay/BlockTableView-Swift"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Cem Olcay" => "ccemolcay@gmail.com" }
  # Or just: s.author    = "Cem Olcay"
  # s.authors            = { "Cem Olcay" => "ccemolcay@gmail.com" }
  # s.social_media_url   = "http://twitter.com/Cem Olcay"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/cemolcay/BlockTableView-Swift.git", :tag => "v0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "BlockTableView-Swift/BlockTableView.swift"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

   s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
