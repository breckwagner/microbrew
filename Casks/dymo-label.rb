cask 'dymo-label' do
  version '8.7'
  sha256 'a0c69c47be728c2e835fa92110457c56ddc32e6941db95f7c783826a10f14ba9'

  url "http://download.dymo.com/dymo/Software/Mac/DLS#{version.major}Setup.#{version}.dmg"
  name 'Dymo Label'
  homepage 'https://www.dymo.com/en-US/online-support'

  pkg "DYMO Label v.#{version.major}.pkg", choices: [
     {
       'choiceIdentifier' => 'application',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 1,
     },
     {
       'choiceIdentifier' => 'appsupport',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 1,
     },
     {
       'choiceIdentifier' => 'frameworks',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 1,
     },
     {
       'choiceIdentifier' => 'documents',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 1,
     },
     {
       'choiceIdentifier' => 'officeaddins',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 0,
     },
     {
       'choiceIdentifier' => 'safariaddin',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 0,
     },
     {
       'choiceIdentifier' => 'addressbookaddin',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 0,
     },
     {
       'choiceIdentifier' => 'npapiaddin',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 0,
     },
     {
       'choiceIdentifier' => 'cups',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 1,
     },
     {
       'choiceIdentifier' => 'uninstall',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 0,
     },
     {
       'choiceIdentifier' => 'webservice',
       'choiceAttribute'  => 'selected',
       'attributeSetting' => 0,
     }
   ]

  uninstall launchctl: 'com.dymo.pnpd', pkgutil: [
     'com.dymo.cups',
     'com.dymo.dls.addressbook.addin',
     'com.dymo.dls.application',
     'com.dymo.dls.appsupport',
     'com.dymo.dls.documents',
     'com.dymo.dls.frameworks',
     'com.dymo.dls.npapi.addin',
     'com.dymo.dls.office.addins',
     'com.dymo.dls.safari.addin',
   ]

  zap delete: [
    '~/Library/Preferences/com.dymo.dls.plist',
    '~/Library/Caches/com.dymo.dls',
  ]
end
