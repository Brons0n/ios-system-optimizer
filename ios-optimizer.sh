#!/bin/bash

[ -d "/var/jb/usr/bin" ] && JBROOT="/var/jb" || JBROOT=""
LAUNCHCTL="${JBROOT}/usr/bin/launchctl"

${JBROOT}/sbin/mount -o rw,union,update / 2>/dev/null || /usr/bin/mount -o rw,union,update / 2>/dev/null

for d in com.apple.analyticsd com.apple.hangtracerd com.apple.diagnosticd com.apple.sysdiagnose_helper com.apple.osanalytics.osanalyticshelper com.apple.spindump com.apple.spindump_symbolicator com.apple.microstackshot com.apple.tailspind com.apple.relevanced com.apple.CrashReporterSupportHelper com.apple.ReportMemoryException com.apple.symptomsd com.apple.symptomsd-helper com.apple.SyncAgent com.apple.syslogd com.apple.logd; do
    $LAUNCHCTL bootout system/$d 2>/dev/null
    $LAUNCHCTL disable system/$d 2>/dev/null
done

for a in com.apple.parsecd com.apple.duetexpertd com.apple.intelligenceplatformd com.apple.suggestd com.apple.UsageTrackingAgent com.apple.OSAnalytics.reportSegmentsAgent; do
    $LAUNCHCTL bootout gui/501/$a 2>/dev/null
    $LAUNCHCTL disable gui/501/$a 2>/dev/null
done

rm -rf \
/System/Library/LaunchDaemons/com.apple.syslogd.plist \
/System/Library/LaunchDaemons/com.apple.logd.plist \
/System/Library/LaunchDaemons/com.apple.analyticsd.plist \
/System/Library/LaunchDaemons/com.apple.hangtracerd.plist \
/System/Library/LaunchDaemons/com.apple.diagnosticd.plist \
/System/Library/LaunchDaemons/com.apple.SyncAgent.plist \
/System/Library/LaunchDaemons/com.apple.sysdiagnose_helper.plist \
/System/Library/Messages/PlugIns/iMessage.imservice \
/System/Library/Messages/PlugIns/FaceTime.imservice \
/System/Library/PrivateFrameworks/CoreAnalytics.framework \
/System/Library/PrivateFrameworks/DiagnosticsKit.framework \
/System/Library/PrivateFrameworks/DiagnosticsSupport.framework \
/System/Library/PrivateFrameworks/DiagnosticLogCollection.framework \
/System/Library/PrivateFrameworks/DiagnosticRequestService.framework \
/System/Library/PrivateFrameworks/DiagnosticsReporterServices.framework \
/System/Library/PrivateFrameworks/SymptomDiagnosticReporter.framework \
/System/Library/PrivateFrameworks/HangTracer.framework \
/System/Library/PrivateFrameworks/PerformanceTrace.framework \
/System/Library/PrivateFrameworks/perfdata.framework \
/System/Library/PrivateFrameworks/kperf.framework \
/System/Library/PrivateFrameworks/RecapPerformanceTesting.framework \
/System/Library/PrivateFrameworks/AppAnalytics.framework \
/System/Library/PrivateFrameworks/AudioAnalytics.framework \
/System/Library/PrivateFrameworks/MemoryDiagnostics.framework \
/System/Library/PrivateFrameworks/iOSDiagnostics.framework \
/System/Library/PrivateFrameworks/LighthouseSiriDiagnostics.framework \
/System/Library/PrivateFrameworks/HardwareDiagnostics.framework \
/System/Library/PrivateFrameworks/CellularDataDiagnosticsSuite.framework \
/System/Library/PrivateFrameworks/GPUToolsDiagnostics.framework \
/System/Library/PrivateFrameworks/AGXGPURawCounter.framework \
/System/Library/PrivateFrameworks/GPURawCounter.framework \
/System/Library/PrivateFrameworks/AttentionAwareness.framework \
/System/Library/PrivateFrameworks/BackgroundTaskAgent.framework \
/System/Library/PrivateFrameworks/OSIntelligence.framework \
/System/Library/PrivateFrameworks/IntelligencePlatform.framework \
/System/Library/PrivateFrameworks/IntelligenceEngine.framework \
/System/Library/RelevanceEngine/NanoDataSources \
/System/Library/CoreDuet \
/System/Library/DuetExpertCenter \
/System/Library/DuetActivityScheduler \
/System/Library/PrivateFrameworks/CoreDuetSync.framework \
/System/Library/Assistant/PrivateLearningPlugins \
/System/Library/Assistant/Plugins/SiriPrivateLearningAnalytics.assistantBundle \
/System/Library/Assistant/UIPlugins/AcousticId.siriUIBundle \
/System/Library/SyncBundles/Books.syncBundle \
/System/Library/SyncBundles/LogsPlugin.syncBundle \
/System/Library/SyncBundles/Podcasts.syncBundle \
/System/Library/SyncBundles/MBATCPlugin.syncBundle \
/System/Library/SyncBundles/ProofingPlugin.syncBundle \
/System/Library/SyncBundles/AirFair.syncBundle \
/System/Library/SyncBundles/AirFair2.syncBundle \
/System/Library/SyncBundles/Tones.syncBundle \
/System/Library/SyncBundles/MobileSlideShow.syncBundle \
/System/Library/SyncBundles/Apps.syncBundle \
/System/Library/SyncBundles/MusicLibrary.syncBundle \
/System/Library/SyncBundles/UserDataPlugin.syncBundle \
/System/Library/OnBoardingBundles/com.apple.onboarding.advertising.bundle \
/System/Library/OnBoardingBundles/com.apple.onboarding.analyticsapp.bundle \
/System/Library/OnBoardingBundles/com.apple.onboarding.analyticsdevice.bundle \
/System/Library/OnBoardingBundles/com.apple.onboarding.analyticsicloud.bundle \
/System/Library/UserEventPlugins/com.apple.telemetry.plugin \
/System/Library/UserEventPlugins/ADEventListenerPlugin.plugin \
/System/Library/UserEventPlugins/GreenTeaUserEventAgent.plugin \
/System/Library/UsageBundles \
/System/Library/AMSEngagement \
/System/Library/DistributedEvaluation \
/System/Library/Trace \
/System/Library/Preferences/Logging \
/dev/oslog \
/dev/oslog_stream \
/System/Library/ScreenReader \
/System/Library/TTSPlugins \
/System/Library/VoiceServices/PlugIns \
/System/Library/CoreServices/AccessibilityUIServer.app \
/System/Library/CoreServices/LiveTranscriptionUI.app \
/System/Library/BulletinDistributor \
/System/Library/CacheDelete \
/System/Library/CoreServices/CacheDeleteDaily \
/System/Library/CoreServices/CacheDeleteAppContainerCaches \
/System/Library/LocationBundles/CountryTracker.bundle \
/System/Library/LocationBundles/TraceHarvest.bundle \
/System/Library/LocationBundles/ExposureNotificationBundle.bundle \
/System/Library/LocationBundles/AppGenius.bundle \
/System/Library/LocationBundles/HandwashingLocation.bundle \
/Applications/ExposureNotificationRemoteViewService.app \
/System/Library/PreferenceBundles/ExposureNotificationSettingsUI.bundle \
/System/Library/UserNotifications/Bundles/com.apple.ExposureNotification.UserNotification.bundle \
/Applications/Diagnostics.app \
/Applications/DiagnosticsReporter.app \
/Applications/DiagnosticsService.app \
/usr/libexec/findmydeviced \
/Applications/FindMyExtensionContainer.app \
/Applications/FindMyRemoteUIService.app \
/System/Library/Assistant/Plugins/SiriFindMyBundle.assistantBundle \
/System/Library/Assistant/UIPlugins/SiriFindMyUIPlugin.siriUIBundle \
/System/Library/LocationBundles/SafetyAlerts.bundle \
/System/Library/SpringBoardPlugins/StoreDemoPlugin.servicebundle \
/Applications/DemoApp.app \
/Applications/CheckerBoard.app \
/Applications/CheckerBoardRemoteSetup.app \
/Applications/FTMInternal-4.app \
/Applications/FieldTest.app \
/Applications/DDActionsService.app \
/Applications/DataActivation.app \
/System/Library/NanoPreferenceBundles/General \
/System/Library/NanoPreferenceBundles/SetupBundles \
/System/Library/NanoPreferenceBundles/Discover \
/System/Library/NanoPreferenceBundles/Applications \
/System/Library/PrivateFrameworks/MapsSync.framework \
/System/Library/PrivateFrameworks/NanoMusicSync.framework \
/System/Library/BridgeManifests \
/System/Library/PairedSyncServices \
/System/Library/UserNotifications/Bundles/com.apple.SensorKit.reminder.bundle \
/System/Library/UserNotifications/Bundles/com.apple.PerformanceTrace.notifications.bundle \
/System/Library/UserNotifications/Bundles/com.apple.hangtracerd.usernotifications.bundle \
/System/Library/UserNotifications/Bundles/com.apple.FindMySafetyAlertsNotifications.bundle \
/System/Library/UserNotifications/Bundles/com.apple.ScreenTimeDowntimeNotifications.bundle \
/System/Library/SetupAssistantBundles \
/System/Library/CardServices \
/System/Library/CardKit \
/System/Library/PrivateFrameworks/CardServices.framework \
/System/Library/Frameworks/PushToTalk.framework \
/System/Library/PrivateFrameworks/DictionaryUI.framework \
/System/Library/PrivateFrameworks/DictionaryServices.framework \
/System/Library/PrivateFrameworks/AggregateDictionaryHistory.framework \
/System/Library/PreferenceBundles/DictionarySettings.bundle \
/System/Library/CoreServices/osanalyticshelper \
/System/Library/CoreServices/CloudSettingsSyncAgent \
/System/Library/CoreServices/EscrowSecurityAlert.app \
/System/Library/ControlCenter/Bundles/FeedbackAssistantModule.bundle \
/System/Library/ControlCenter/Bundles/PerformanceTraceModule.bundle \
/System/Library/PreferenceBundles/DigitalSeparationSettings.bundle \
/System/Library/PreferenceBundles/PodcastsSettingsPlugin.bundle \
/System/Library/PreferenceBundles/VideoSubscriberAccountDeveloperSettings.bundle \
/System/Library/PreferenceBundles/VideoSubscriberAccountSettings.bundle \
/System/Library/PreferenceBundles/VideoSubscriberAccountTVAppDeveloperSettings.bundle \
/System/Library/PreferenceBundles/TVSettings.bundle \
/System/Library/DigitalSeparation/SharingSources \
/System/Library/Snippets/UIPlugins \
/System/Library/Previews/ShellPlugins \
/usr/libexec/diagnosticd \
/usr/libexec/diagnosticextensionsd \
/sbin/dmesg \
/var/mobile/Library/OSIntelligence \
/var/mobile/Library/OSAnalytics
