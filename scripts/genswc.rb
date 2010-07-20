asfiles=File.join("./src/as/**","*.as")
d=Dir.glob(asfiles)
final_out="~/Development/lib/flex3sdk/bin/compc "
final_out << "-sp ~/Development/git/guttershark/src/as/ "
final_out << "-sp ~/Development/lib/actionscript/externals/ "
if File.directory?('/Applications/Adobe Flash CS4/Common/Configuration/ActionScript 3.0/FP10/playerglobal.swc')
  final_out << "-external-library-path '/Applications/Adobe Flash CS4/Common/Configuration/ActionScript 3.0/FP10/playerglobal.swc' "
end
if File.directory?('/Applications/Adobe CS4/Adobe Flash CS4/Common/Configuration/ActionScript 3.0/FP10/playerglobal.swc')
  final_out << "-external-library-path '/Applications/Adobe CS4/Adobe Flash CS4/Common/Configuration/ActionScript 3.0/FP10/playerglobal.swc' "
end
if File.directory?('/Applications/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlayback/')
  final_out << "-sp '/Applications/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlayback/' "
end
if File.directory?('/Applications/Adobe CS4/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlayback/')
  final_out << "-sp '/Applications/Adobe CS4/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlayback/' "
end
if File.directory?('/Applications/Adobe CS4/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlaybackCaptioning/')
  final_out << "-sp '/Applications/Adobe CS4/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlaybackCaptioning/' "
end
if File.directory?('/Applications/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlaybackCaptioning/')
  final_out << "-sp '/Applications/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/FLVPlaybackCaptioning/' "
end
#final_out << "-sp '/Applications/Adobe Flash CS4/Common/Configuration/Component Source/Actionscript 3.0/User Interface/' "
final_out << "-load-externs libs/gsreport.xml "
final_out << "-o libs/guttershark.swc "
final_out << "-ic "
d.each do |dir|
  s=dir.split("/").join(".")
  j=s.split(".")
  j.pop()
  s=j.join(".")
  s.sub!("..src.as.","")
  final_out << "#{s} "
end
final_out << " -optimize"
final_out << " -debug=false"
#final_out << " -compute-digest=true"
#final_out << " -include-lookup-only=true"
#final_out << " -verify-digests=true"
system(final_out)