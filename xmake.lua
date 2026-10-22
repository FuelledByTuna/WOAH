-- include subprojects
includes("lib/commonlibf4")

-- set project constants
set_project("WOAH")
set_version("0.0.0")
set_license("GPL-3.0")
set_languages("c++23")
set_warnings("allextra")

-- add common rules
add_rules("mode.debug", "mode.releasedbg")
add_rules("plugin.vsxmake.autoupdate")

-- define targets
target("WOAH")
    add_rules("commonlibf4.plugin", {
        name = "WOAH",
        author = "FuelledByTuna",
        description = "Workshop Object Action History: undo and redo for workshop actions"
    })

    -- add src files
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src")
    set_pcxxheader("src/pch.h")

    -- copy the DLL into package\F4SE\Plugins after every build
    after_build(function (target)
        local dest = path.join(os.projectdir(), "package", "F4SE", "Plugins")
        os.mkdir(dest)
        os.cp(target:targetfile(), dest)
    end)
