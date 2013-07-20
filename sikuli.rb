require 'rubygems'
#require './java'
require "sikuli-script.jar"
java_import 'org.sikuli.script.Region'
java_import 'org.sikuli.script.Screen'
java_import 'org.sikuli.script.Settings'
java_import 'org.sikuli.script.SikuliEvent'
java_import 'org.sikuli.script.SikuliScript'
include Java
Sikuli=Java::OrgSikuliScript
