include(":app")

fun flutterPlugin(name: String) {
    include(":$name")
    project(":$name").apply {
        projectDir = File(settingsDir, "flutter/$name")
        buildFileName = "build.gradle.kts"
    }
}

val flutterSdkPath: String? = System.getenv("FLUTTER_ROOT")
    ?: (File("local.properties").takeIf { it.exists() }?.readLines()
        ?.map { it.split("=").map { it.trim() } }
        ?.find { it[0] == "flutter.sdk" }
        ?.get(1))

if (flutterSdkPath != null) {
    val pluginsFile = File("$flutterSdkPath/packages/flutter_tools/gradle/plugin_list")
    if (pluginsFile.exists()) {
        pluginsFile.readLines().forEach { flutterPlugin(it) }
    }
}
