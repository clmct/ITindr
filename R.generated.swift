//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `Montserrat-Bold.ttf`.
    static let montserratBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Bold", pathExtension: "ttf")
    /// Resource file `Montserrat-Regular.ttf`.
    static let montserratRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Montserrat-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "Montserrat-Bold", withExtension: "ttf")`
    static func montserratBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Montserrat-Regular", withExtension: "ttf")`
    static func montserratRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.montserratRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 2 fonts.
  struct font: Rswift.Validatable {
    /// Font `Montserrat-Bold`.
    static let montserratBold = Rswift.FontResource(fontName: "Montserrat-Bold")
    /// Font `Montserrat-Regular`.
    static let montserratRegular = Rswift.FontResource(fontName: "Montserrat-Regular")

    /// `UIFont(name: "Montserrat-Bold", size: ...)`
    static func montserratBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratBold, size: size)
    }

    /// `UIFont(name: "Montserrat-Regular", size: ...)`
    static func montserratRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: montserratRegular, size: size)
    }

    static func validate() throws {
      if R.font.montserratBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Bold' could not be loaded, is 'Montserrat-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.montserratRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Montserrat-Regular' could not be loaded, is 'Montserrat-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 15 images.
  struct image {
    /// Image `IT’S A MATCH!`.
    static let itsamatcH = Rswift.ImageResource(bundle: R.hostingBundle, name: "IT’S A MATCH!")
    /// Image `ava`.
    static let ava = Rswift.ImageResource(bundle: R.hostingBundle, name: "ava")
    /// Image `avatar`.
    static let avatar = Rswift.ImageResource(bundle: R.hostingBundle, name: "avatar")
    /// Image `defaultAva`.
    static let defaultAva = Rswift.ImageResource(bundle: R.hostingBundle, name: "defaultAva")
    /// Image `edit`.
    static let edit = Rswift.ImageResource(bundle: R.hostingBundle, name: "edit")
    /// Image `like`.
    static let like = Rswift.ImageResource(bundle: R.hostingBundle, name: "like")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `people`.
    static let people = Rswift.ImageResource(bundle: R.hostingBundle, name: "people")
    /// Image `photo-button`.
    static let photoButton = Rswift.ImageResource(bundle: R.hostingBundle, name: "photo-button")
    /// Image `reject`.
    static let reject = Rswift.ImageResource(bundle: R.hostingBundle, name: "reject")
    /// Image `send-button`.
    static let sendButton = Rswift.ImageResource(bundle: R.hostingBundle, name: "send-button")
    /// Image `tabBar-0`.
    static let tabBar0 = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabBar-0")
    /// Image `tabBar-1`.
    static let tabBar1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabBar-1")
    /// Image `tabBar-2`.
    static let tabBar2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabBar-2")
    /// Image `tabBar-3`.
    static let tabBar3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "tabBar-3")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "IT’S A MATCH!", bundle: ..., traitCollection: ...)`
    static func itsamatcH(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.itsamatcH, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ava", bundle: ..., traitCollection: ...)`
    static func ava(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ava, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "avatar", bundle: ..., traitCollection: ...)`
    static func avatar(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.avatar, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "defaultAva", bundle: ..., traitCollection: ...)`
    static func defaultAva(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.defaultAva, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "edit", bundle: ..., traitCollection: ...)`
    static func edit(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.edit, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "like", bundle: ..., traitCollection: ...)`
    static func like(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.like, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "people", bundle: ..., traitCollection: ...)`
    static func people(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.people, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "photo-button", bundle: ..., traitCollection: ...)`
    static func photoButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.photoButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "reject", bundle: ..., traitCollection: ...)`
    static func reject(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.reject, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "send-button", bundle: ..., traitCollection: ...)`
    static func sendButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sendButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tabBar-0", bundle: ..., traitCollection: ...)`
    static func tabBar0(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabBar0, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tabBar-1", bundle: ..., traitCollection: ...)`
    static func tabBar1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabBar1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tabBar-2", bundle: ..., traitCollection: ...)`
    static func tabBar2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabBar2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tabBar-3", bundle: ..., traitCollection: ...)`
    static func tabBar3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tabBar3, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 13 localization keys.
    struct localizable {
      /// Value: Cancel
      static let cancel = Rswift.StringResource(key: "cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Take photo
      static let takePhoto = Rswift.StringResource(key: "take.photo", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ваши интерфейсы подошли друг к другу
      static let matchTitle = Rswift.StringResource(key: "match.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Выбрать фото
      static let choosePhoto = Rswift.StringResource(key: "choose.photo", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Люди
      static let people = Rswift.StringResource(key: "people", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Написать сообщение
      static let writeMessage = Rswift.StringResource(key: "write.message", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ошибка валидации
      static let errorValidation = Rswift.StringResource(key: "error.validation", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Поиск
      static let search = Rswift.StringResource(key: "search", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Профиль
      static let profile = Rswift.StringResource(key: "profile", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Редактировать
      static let edit = Rswift.StringResource(key: "edit", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Удалить фото
      static let deletePhoto = Rswift.StringResource(key: "delete.photo", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Хорошо
      static let ok = Rswift.StringResource(key: "ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Чаты
      static let chats = Rswift.StringResource(key: "chats", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Cancel
      static func cancel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("cancel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "cancel"
        }

        return NSLocalizedString("cancel", bundle: bundle, comment: "")
      }

      /// Value: Take photo
      static func takePhoto(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("take.photo", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "take.photo"
        }

        return NSLocalizedString("take.photo", bundle: bundle, comment: "")
      }

      /// Value: Ваши интерфейсы подошли друг к другу
      static func matchTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("match.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "match.title"
        }

        return NSLocalizedString("match.title", bundle: bundle, comment: "")
      }

      /// Value: Выбрать фото
      static func choosePhoto(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("choose.photo", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "choose.photo"
        }

        return NSLocalizedString("choose.photo", bundle: bundle, comment: "")
      }

      /// Value: Люди
      static func people(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("people", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "people"
        }

        return NSLocalizedString("people", bundle: bundle, comment: "")
      }

      /// Value: Написать сообщение
      static func writeMessage(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("write.message", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "write.message"
        }

        return NSLocalizedString("write.message", bundle: bundle, comment: "")
      }

      /// Value: Ошибка валидации
      static func errorValidation(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error.validation", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error.validation"
        }

        return NSLocalizedString("error.validation", bundle: bundle, comment: "")
      }

      /// Value: Поиск
      static func search(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("search", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "search"
        }

        return NSLocalizedString("search", bundle: bundle, comment: "")
      }

      /// Value: Профиль
      static func profile(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("profile", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "profile"
        }

        return NSLocalizedString("profile", bundle: bundle, comment: "")
      }

      /// Value: Редактировать
      static func edit(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("edit", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "edit"
        }

        return NSLocalizedString("edit", bundle: bundle, comment: "")
      }

      /// Value: Удалить фото
      static func deletePhoto(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("delete.photo", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "delete.photo"
        }

        return NSLocalizedString("delete.photo", bundle: bundle, comment: "")
      }

      /// Value: Хорошо
      static func ok(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "ok"
        }

        return NSLocalizedString("ok", bundle: bundle, comment: "")
      }

      /// Value: Чаты
      static func chats(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("chats", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "chats"
        }

        return NSLocalizedString("chats", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
