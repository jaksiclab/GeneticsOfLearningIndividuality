<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ic-package" urn="urn:adsk.eagle:library:239">
<description>&lt;b&gt;IC Packages an Sockets&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL20" urn="urn:adsk.eagle:footprint:16206/1" library_version="4">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="12.7" y1="2.921" x2="-12.7" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-2.921" x2="12.7" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="12.7" y1="2.921" x2="12.7" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="2.921" x2="-12.7" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-2.921" x2="-12.7" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.016" x2="-12.7" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="-11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-13.081" y="-3.048" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-9.779" y="-0.381" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SOCKET-20" urn="urn:adsk.eagle:footprint:14350/1" library_version="4">
<description>&lt;b&gt;Dual In Line Socket&lt;/b&gt;</description>
<wire x1="12.7" y1="5.08" x2="-12.7" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-5.08" x2="12.7" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="5.08" x2="-12.7" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-5.08" x2="-12.7" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.016" x2="-12.7" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<wire x1="-12.7" y1="2.54" x2="12.7" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="2.54" x2="-12.7" y2="1.016" width="0.1524" layer="21"/>
<wire x1="12.7" y1="2.54" x2="12.7" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-2.54" x2="12.7" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-2.54" x2="-12.7" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-2.54" x2="12.7" y2="-5.08" width="0.1524" layer="21"/>
<pad name="1" x="-11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="11.43" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="17" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="18" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="19" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="20" x="-11.43" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-6.477" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-12.954" y="-4.953" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
</package>
</packages>
<packages3d>
<package3d name="DIL20" urn="urn:adsk.eagle:package:16429/2" type="model" library_version="4">
<description>Dual In Line Package</description>
<packageinstances>
<packageinstance name="DIL20"/>
</packageinstances>
</package3d>
<package3d name="SOCKET-20" urn="urn:adsk.eagle:package:14438/1" type="box" library_version="4">
<description>Dual In Line Socket</description>
<packageinstances>
<packageinstance name="SOCKET-20"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="DIL20" urn="urn:adsk.eagle:symbol:14348/1" library_version="4">
<wire x1="-5.08" y1="11.43" x2="-5.08" y2="-13.97" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-13.97" x2="5.08" y2="-13.97" width="0.254" layer="94"/>
<wire x1="5.08" y1="-13.97" x2="5.08" y2="11.43" width="0.254" layer="94"/>
<wire x1="5.08" y1="11.43" x2="2.54" y2="11.43" width="0.254" layer="94"/>
<wire x1="-5.08" y1="11.43" x2="-2.54" y2="11.43" width="0.254" layer="94"/>
<wire x1="-2.54" y1="11.43" x2="2.54" y2="11.43" width="0.254" layer="94" curve="180"/>
<text x="-4.445" y="12.065" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.445" y="-16.51" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-7.62" y="10.16" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-7.62" y="7.62" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-7.62" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-7.62" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="5" x="-7.62" y="0" visible="pad" length="short" direction="pas"/>
<pin name="6" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="7" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas"/>
<pin name="8" x="-7.62" y="-7.62" visible="pad" length="short" direction="pas"/>
<pin name="9" x="-7.62" y="-10.16" visible="pad" length="short" direction="pas"/>
<pin name="10" x="-7.62" y="-12.7" visible="pad" length="short" direction="pas"/>
<pin name="11" x="7.62" y="-12.7" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="12" x="7.62" y="-10.16" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="13" x="7.62" y="-7.62" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="14" x="7.62" y="-5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="15" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="16" x="7.62" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="17" x="7.62" y="2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="18" x="7.62" y="5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="19" x="7.62" y="7.62" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="20" x="7.62" y="10.16" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DIL20" urn="urn:adsk.eagle:component:14473/3" prefix="IC" uservalue="yes" library_version="4">
<description>&lt;b&gt;Dual In Line / Socket&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="DIL20" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DIL20">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:16429/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="S" package="SOCKET-20">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14438/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex" urn="urn:adsk.eagle:library:165">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="22-23-2061" urn="urn:adsk.eagle:footprint:8078263/1" library_version="5">
<description>&lt;b&gt;KK® 254 Solid Header, Vertical, with Friction Lock, 6 Circuits, Tin (Sn) Plating&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/022232061_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-7.62" y1="3.175" x2="7.62" y2="3.175" width="0.254" layer="21"/>
<wire x1="7.62" y1="3.175" x2="7.62" y2="1.27" width="0.254" layer="21"/>
<wire x1="7.62" y1="1.27" x2="7.62" y2="-3.175" width="0.254" layer="21"/>
<wire x1="7.62" y1="-3.175" x2="-7.62" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-7.62" y1="-3.175" x2="-7.62" y2="1.27" width="0.254" layer="21"/>
<wire x1="-7.62" y1="1.27" x2="-7.62" y2="3.175" width="0.254" layer="21"/>
<wire x1="-7.62" y1="1.27" x2="7.62" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" shape="long" rot="R90"/>
<text x="-7.62" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="22-23-2021" urn="urn:adsk.eagle:footprint:8078259/1" library_version="5">
<description>&lt;b&gt;KK® 254 Solid Header, Vertical, with Friction Lock, 2 Circuits, Tin (Sn) Plating&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/022232021_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-2.54" y1="3.175" x2="2.54" y2="3.175" width="0.254" layer="21"/>
<wire x1="2.54" y1="3.175" x2="2.54" y2="1.27" width="0.254" layer="21"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-3.175" width="0.254" layer="21"/>
<wire x1="2.54" y1="-3.175" x2="-2.54" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-2.54" y1="-3.175" x2="-2.54" y2="1.27" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="3.175" width="0.254" layer="21"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<text x="-2.54" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="22-23-2081" urn="urn:adsk.eagle:footprint:8078265/1" library_version="5">
<description>&lt;b&gt;KK® 254 Solid Header, Vertical, with Friction Lock, 8 Circuits, Tin (Sn) Plating&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/022232081_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-10.16" y1="3.175" x2="10.16" y2="3.175" width="0.254" layer="21"/>
<wire x1="10.16" y1="3.175" x2="10.16" y2="1.27" width="0.254" layer="21"/>
<wire x1="10.16" y1="1.27" x2="10.16" y2="-3.175" width="0.254" layer="21"/>
<wire x1="10.16" y1="-3.175" x2="-10.16" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-10.16" y1="-3.175" x2="-10.16" y2="1.27" width="0.254" layer="21"/>
<wire x1="-10.16" y1="1.27" x2="-10.16" y2="3.175" width="0.254" layer="21"/>
<wire x1="-10.16" y1="1.27" x2="10.16" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-8.89" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1" shape="long" rot="R90"/>
<text x="-10.16" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.16" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="22-23-2061" urn="urn:adsk.eagle:package:8078637/1" type="box" library_version="5">
<description>&lt;b&gt;KK® 254 Solid Header, Vertical, with Friction Lock, 6 Circuits, Tin (Sn) Plating&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/022232061_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<packageinstances>
<packageinstance name="22-23-2061"/>
</packageinstances>
</package3d>
<package3d name="22-23-2021" urn="urn:adsk.eagle:package:8078633/1" type="box" library_version="5">
<description>&lt;b&gt;KK® 254 Solid Header, Vertical, with Friction Lock, 2 Circuits, Tin (Sn) Plating&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/022232021_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<packageinstances>
<packageinstance name="22-23-2021"/>
</packageinstances>
</package3d>
<package3d name="22-23-2081" urn="urn:adsk.eagle:package:8078639/1" type="box" library_version="5">
<description>&lt;b&gt;KK® 254 Solid Header, Vertical, with Friction Lock, 8 Circuits, Tin (Sn) Plating&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/022232081_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<packageinstances>
<packageinstance name="22-23-2081"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MV" urn="urn:adsk.eagle:symbol:6783/2" library_version="5">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M" urn="urn:adsk.eagle:symbol:6785/2" library_version="5">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="22-23-2061" urn="urn:adsk.eagle:component:8078934/3" prefix="X" uservalue="yes" library_version="5">
<description>.100" (2.54mm) Center Header - 6 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2061">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8078637/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2061" constant="no"/>
<attribute name="OC_FARNELL" value="1462922" constant="no"/>
<attribute name="OC_NEWARK" value="27C1933" constant="no"/>
<attribute name="POPULARITY" value="6" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2021" urn="urn:adsk.eagle:component:8078938/3" prefix="X" library_version="5">
<description>.100" (2.54mm) Center Header - 2 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2021">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8078633/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2021" constant="no"/>
<attribute name="OC_FARNELL" value="1462926" constant="no"/>
<attribute name="OC_NEWARK" value="25C3832" constant="no"/>
<attribute name="POPULARITY" value="40" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="22-23-2081" urn="urn:adsk.eagle:component:8078932/3" prefix="X" library_version="5">
<description>.100" (2.54mm) Center Header - 8 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="5.08" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="0" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2081">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8078639/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2081" constant="no"/>
<attribute name="OC_FARNELL" value="1756826" constant="no"/>
<attribute name="OC_NEWARK" value="01C7592" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="capacitor-wima" urn="urn:adsk.eagle:library:116">
<description>&lt;b&gt;WIMA Capacitors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="C10B4" urn="urn:adsk.eagle:footprint:5353/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 13.4 x 4 mm, grid 10.16 mm</description>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="-2.286" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-6.096" y1="2.032" x2="6.096" y2="2.032" width="0.1524" layer="21"/>
<wire x1="6.604" y1="1.524" x2="6.604" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-2.032" x2="-6.096" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-1.524" x2="-6.604" y2="1.524" width="0.1524" layer="21"/>
<wire x1="6.096" y1="2.032" x2="6.604" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="-2.032" x2="6.604" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-1.524" x2="-6.096" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="1.524" x2="-6.096" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-5.08" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-3.429" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-1.651" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C10B5" urn="urn:adsk.eagle:footprint:5354/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 13.4 x 5 mm, grid 10.16 mm</description>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="-2.286" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-6.096" y1="2.54" x2="6.096" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.604" y1="2.032" x2="6.604" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-2.54" x2="-6.096" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-2.032" x2="-6.604" y2="2.032" width="0.1524" layer="21"/>
<wire x1="6.096" y1="2.54" x2="6.604" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="-2.54" x2="6.604" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-2.032" x2="-6.096" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="2.032" x2="-6.096" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-5.08" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-5.08" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C10B6" urn="urn:adsk.eagle:footprint:5355/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 13.4 x 6 mm, grid 10.16 mm</description>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="-2.286" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-6.096" y1="3.048" x2="6.096" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.604" y1="2.54" x2="6.604" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.048" x2="-6.096" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-2.54" x2="-6.604" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.096" y1="3.048" x2="6.604" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="-3.048" x2="6.604" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-2.54" x2="-6.096" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="2.54" x2="-6.096" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-5.08" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-5.08" y="3.302" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-2.032" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C15B5" urn="urn:adsk.eagle:footprint:5356/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 18 x 5 mm, grid 15 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="2.032" x2="9.017" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-2.54" x2="-8.509" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-2.032" x2="-9.017" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="2.54" x2="8.509" y2="2.54" width="0.1524" layer="21"/>
<wire x1="8.509" y1="2.54" x2="9.017" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-2.54" x2="9.017" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-2.032" x2="-8.509" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="2.032" x2="-8.509" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-7.493" y="2.794" size="1.397" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.032" size="1.397" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C15B6" urn="urn:adsk.eagle:footprint:5357/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 18 x 6 mm, grid 15 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="2.54" x2="9.017" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.048" x2="-8.509" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-2.54" x2="-9.017" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="3.048" x2="8.509" y2="3.048" width="0.1524" layer="21"/>
<wire x1="8.509" y1="3.048" x2="9.017" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-3.048" x2="9.017" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-2.54" x2="-8.509" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="2.54" x2="-8.509" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-7.493" y="3.302" size="1.397" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.032" size="1.397" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C15B7" urn="urn:adsk.eagle:footprint:5358/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 18 x 7 mm, grid 15 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.048" x2="9.017" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.556" x2="-8.509" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.048" x2="-9.017" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="3.556" x2="8.509" y2="3.556" width="0.1524" layer="21"/>
<wire x1="8.509" y1="3.556" x2="9.017" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-3.556" x2="9.017" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-3.048" x2="-8.509" y2="-3.556" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="3.048" x2="-8.509" y2="3.556" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-7.493" y="3.81" size="1.397" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.286" size="1.397" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C15B8" urn="urn:adsk.eagle:footprint:5359/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 18 x 8 mm, grid 15 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.556" x2="9.017" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-4.064" x2="-8.509" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.556" x2="-9.017" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="4.064" x2="8.509" y2="4.064" width="0.1524" layer="21"/>
<wire x1="8.509" y1="4.064" x2="9.017" y2="3.556" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-4.064" x2="9.017" y2="-3.556" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-3.556" x2="-8.509" y2="-4.064" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="3.556" x2="-8.509" y2="4.064" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-7.493" y="4.318" size="1.397" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.54" size="1.397" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C15B9" urn="urn:adsk.eagle:footprint:5360/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 18 x 9 mm, grid 15 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.937" x2="9.017" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-4.445" x2="-8.509" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.937" x2="-9.017" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="4.445" x2="8.509" y2="4.445" width="0.1524" layer="21"/>
<wire x1="8.509" y1="4.445" x2="9.017" y2="3.937" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-4.445" x2="9.017" y2="-3.937" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-3.937" x2="-8.509" y2="-4.445" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="3.937" x2="-8.509" y2="4.445" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" diameter="2.159" shape="octagon"/>
<text x="-7.493" y="4.699" size="1.397" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.54" size="1.397" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C2.5-2" urn="urn:adsk.eagle:footprint:5361/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 5 x 2.5 mm, grid 2.54 mm</description>
<wire x1="-2.159" y1="1.27" x2="2.159" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.27" x2="-2.159" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.27" x2="2.413" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.016" x2="-2.159" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.27" x2="2.413" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.016" x2="-2.159" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="1.27" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-1.651" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.651" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C2.5-4" urn="urn:adsk.eagle:footprint:5362/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 5 x 4 mm, grid 2.54 mm</description>
<wire x1="-2.159" y1="1.905" x2="2.159" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.905" x2="-2.159" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.651" x2="2.413" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.651" x2="-2.413" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.905" x2="2.413" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.651" x2="-2.159" y2="1.905" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.905" x2="2.413" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.651" x2="-2.159" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<wire x1="1.27" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-1.651" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.651" y="-3.429" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C2.5-5" urn="urn:adsk.eagle:footprint:5363/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 5 x 5 mm, grid 2.54 mm</description>
<wire x1="-2.159" y1="2.286" x2="2.159" y2="2.286" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.286" x2="-2.159" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.413" y1="2.032" x2="2.413" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="2.032" x2="-2.413" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.286" x2="2.413" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="2.032" x2="-2.159" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-2.286" x2="2.413" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-2.032" x2="-2.159" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="1.27" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-1.778" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.778" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C2.5-6" urn="urn:adsk.eagle:footprint:5364/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 5 x 6 mm, grid 2.54 mm</description>
<wire x1="-2.159" y1="2.794" x2="2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.794" x2="-2.159" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="2.413" y1="2.54" x2="2.413" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="2.54" x2="-2.413" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.794" x2="2.413" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="2.54" x2="-2.159" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-2.794" x2="2.413" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-2.54" x2="-2.159" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="1.27" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="2.667" y="0.762" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C22.5B10" urn="urn:adsk.eagle:footprint:5365/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 27 x 10 mm, grid 22.5 mm</description>
<wire x1="-12.827" y1="5.334" x2="12.827" y2="5.334" width="0.1524" layer="21"/>
<wire x1="13.335" y1="4.826" x2="13.335" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-5.334" x2="-12.827" y2="-5.334" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-4.826" x2="-13.335" y2="4.826" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="5.334" x2="13.335" y2="4.826" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-5.334" x2="13.335" y2="-4.826" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-4.826" x2="-12.827" y2="-5.334" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="4.826" x2="-12.827" y2="5.334" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-11.303" y="5.588" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C22.5B11" urn="urn:adsk.eagle:footprint:5366/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 27 x 11 mm, grid 22.5 mm</description>
<wire x1="-12.827" y1="5.588" x2="12.827" y2="5.588" width="0.1524" layer="21"/>
<wire x1="13.335" y1="5.08" x2="13.335" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-5.588" x2="-12.827" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-5.08" x2="-13.335" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="5.588" x2="13.335" y2="5.08" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-5.588" x2="13.335" y2="-5.08" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-5.08" x2="-12.827" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="5.08" x2="-12.827" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-11.303" y="5.842" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C22.5B6" urn="urn:adsk.eagle:footprint:5367/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 27 x 6 mm, grid 22.5 mm</description>
<wire x1="-12.827" y1="3.048" x2="12.827" y2="3.048" width="0.1524" layer="21"/>
<wire x1="13.335" y1="2.54" x2="13.335" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-3.048" x2="-12.827" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-2.54" x2="-13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="3.048" x2="13.335" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-3.048" x2="13.335" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-2.54" x2="-12.827" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="2.54" x2="-12.827" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-11.303" y="3.302" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C22.5B7" urn="urn:adsk.eagle:footprint:5368/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 27 x 7 mm, grid 22.5 mm</description>
<wire x1="-12.827" y1="3.556" x2="12.827" y2="3.556" width="0.1524" layer="21"/>
<wire x1="13.335" y1="3.048" x2="13.335" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-3.556" x2="-12.827" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-3.048" x2="-13.335" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="3.556" x2="13.335" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-3.556" x2="13.335" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-3.048" x2="-12.827" y2="-3.556" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="3.048" x2="-12.827" y2="3.556" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-11.303" y="3.81" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C22.5B8" urn="urn:adsk.eagle:footprint:5369/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 27 x 8 mm, grid 22.5 mm</description>
<wire x1="-12.827" y1="4.318" x2="12.827" y2="4.318" width="0.1524" layer="21"/>
<wire x1="13.335" y1="3.81" x2="13.335" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-4.318" x2="-12.827" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-3.81" x2="-13.335" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="4.318" x2="13.335" y2="3.81" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-4.318" x2="13.335" y2="-3.81" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-3.81" x2="-12.827" y2="-4.318" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="3.81" x2="-12.827" y2="4.318" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-11.303" y="4.572" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C27.5B11" urn="urn:adsk.eagle:footprint:5370/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 31.6 x 11 mm, grid 27.5 mm</description>
<wire x1="-15.24" y1="5.588" x2="15.24" y2="5.588" width="0.1524" layer="21"/>
<wire x1="15.748" y1="5.08" x2="15.748" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-5.588" x2="-15.24" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-5.08" x2="-15.748" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="5.588" x2="15.748" y2="5.08" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-5.588" x2="15.748" y2="-5.08" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-5.08" x2="-15.24" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="5.08" x2="-15.24" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<text x="-13.716" y="5.842" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C27.5B13" urn="urn:adsk.eagle:footprint:5371/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 31.6 x 13 mm, grid 27.5 mm</description>
<wire x1="-15.24" y1="6.604" x2="15.24" y2="6.604" width="0.1524" layer="21"/>
<wire x1="15.748" y1="6.096" x2="15.748" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-6.604" x2="-15.24" y2="-6.604" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-6.096" x2="-15.748" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="6.604" x2="15.748" y2="6.096" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-6.604" x2="15.748" y2="-6.096" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-6.096" x2="-15.24" y2="-6.604" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="6.096" x2="-15.24" y2="6.604" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<text x="-13.716" y="6.858" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C27.5B15" urn="urn:adsk.eagle:footprint:5372/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 31.6 x 15 mm, grid 27.5 mm</description>
<wire x1="-15.24" y1="7.62" x2="15.24" y2="7.62" width="0.1524" layer="21"/>
<wire x1="15.748" y1="7.112" x2="15.748" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-7.62" x2="-15.24" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-7.112" x2="-15.748" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="7.62" x2="15.748" y2="7.112" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-7.62" x2="15.748" y2="-7.112" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-7.112" x2="-15.24" y2="-7.62" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="7.112" x2="-15.24" y2="7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<text x="-13.716" y="7.874" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C27.5B17" urn="urn:adsk.eagle:footprint:5373/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 31.6 x 17 mm, grid 27.5 mm</description>
<wire x1="-15.24" y1="8.509" x2="15.24" y2="8.509" width="0.1524" layer="21"/>
<wire x1="15.748" y1="8.001" x2="15.748" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-8.509" x2="-15.24" y2="-8.509" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-8.001" x2="-15.748" y2="8.001" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="8.509" x2="15.748" y2="8.001" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-8.509" x2="15.748" y2="-8.001" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-8.001" x2="-15.24" y2="-8.509" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="8.001" x2="-15.24" y2="8.509" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<text x="-13.716" y="8.763" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C27.5B20" urn="urn:adsk.eagle:footprint:5374/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 31.6 x 20 mm, grid 27.5 mm</description>
<wire x1="-15.24" y1="10.16" x2="15.24" y2="10.16" width="0.1524" layer="21"/>
<wire x1="15.748" y1="9.652" x2="15.748" y2="-9.652" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-10.16" x2="-15.24" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-9.652" x2="-15.748" y2="9.652" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="10.16" x2="15.748" y2="9.652" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-10.16" x2="15.748" y2="-9.652" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-9.652" x2="-15.24" y2="-10.16" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="9.652" x2="-15.24" y2="10.16" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<text x="-13.589" y="10.414" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.318" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C27.5B9" urn="urn:adsk.eagle:footprint:5375/1" library_version="2">
<description>&lt;B&gt;MKS4&lt;/B&gt;, 31.6 x 9 mm, grid 27.5 mm</description>
<wire x1="-15.24" y1="4.572" x2="15.24" y2="4.572" width="0.1524" layer="21"/>
<wire x1="15.748" y1="4.064" x2="15.748" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-4.572" x2="-15.24" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-4.064" x2="-15.748" y2="4.064" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="4.572" x2="15.748" y2="4.064" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-4.572" x2="15.748" y2="-4.064" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-4.064" x2="-15.24" y2="-4.572" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="4.064" x2="-15.24" y2="4.572" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" diameter="3.1496" shape="octagon"/>
<text x="-13.589" y="4.826" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C37.5B15" urn="urn:adsk.eagle:footprint:5376/1" library_version="2">
<description>&lt;B&gt;MKP4&lt;/B&gt;, 42 x 15 mm, grid 37.5 mm</description>
<wire x1="-20.32" y1="7.62" x2="20.32" y2="7.62" width="0.1524" layer="21"/>
<wire x1="20.828" y1="7.112" x2="20.828" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-7.62" x2="-20.32" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-7.112" x2="-20.828" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="20.32" y1="7.62" x2="20.828" y2="7.112" width="0.1524" layer="21" curve="-90"/>
<wire x1="20.32" y1="-7.62" x2="20.828" y2="-7.112" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="-7.112" x2="-20.32" y2="-7.62" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="7.112" x2="-20.32" y2="7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.002" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="16.002" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-18.796" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<pad name="2" x="18.796" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<text x="-18.796" y="7.874" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C37.5B19" urn="urn:adsk.eagle:footprint:5377/1" library_version="2">
<description>&lt;B&gt;MKP4&lt;/B&gt;, 42 x 19 mm, grid 37.5 mm</description>
<wire x1="-20.32" y1="8.509" x2="20.32" y2="8.509" width="0.1524" layer="21"/>
<wire x1="20.828" y1="8.001" x2="20.828" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-8.509" x2="-20.32" y2="-8.509" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-8.001" x2="-20.828" y2="8.001" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="20.32" y1="8.509" x2="20.828" y2="8.001" width="0.1524" layer="21" curve="-90"/>
<wire x1="20.32" y1="-8.509" x2="20.828" y2="-8.001" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="-8.001" x2="-20.32" y2="-8.509" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="8.001" x2="-20.32" y2="8.509" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.002" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="16.002" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-18.796" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<pad name="2" x="18.796" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<text x="-18.796" y="8.89" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C37.5B20" urn="urn:adsk.eagle:footprint:5378/1" library_version="2">
<description>&lt;B&gt;MKP4&lt;/B&gt;, 42 x 20 mm, grid 37.5 mm</description>
<wire x1="-20.32" y1="10.16" x2="20.32" y2="10.16" width="0.1524" layer="21"/>
<wire x1="20.828" y1="9.652" x2="20.828" y2="-9.652" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-10.16" x2="-20.32" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-9.652" x2="-20.828" y2="9.652" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="20.32" y1="10.16" x2="20.828" y2="9.652" width="0.1524" layer="21" curve="-90"/>
<wire x1="20.32" y1="-10.16" x2="20.828" y2="-9.652" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="-9.652" x2="-20.32" y2="-10.16" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="9.652" x2="-20.32" y2="10.16" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.002" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="16.002" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-18.796" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<pad name="2" x="18.796" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<text x="-18.796" y="10.414" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B2.5" urn="urn:adsk.eagle:footprint:5379/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 2.5 mm, grid 5.08 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.016" x2="-3.683" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.27" x2="3.429" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.016" x2="3.683" y2="1.016" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.27" x2="-3.429" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.27" x2="3.683" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.27" x2="3.683" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.016" x2="-3.429" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.016" x2="-3.429" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.032" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.032" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B3" urn="urn:adsk.eagle:footprint:5380/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 3 mm, grid 5.08 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.27" x2="-3.683" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.27" x2="3.683" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.524" x2="3.683" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.524" x2="3.683" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.27" x2="-3.429" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.27" x2="-3.429" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="1.778" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B3.5" urn="urn:adsk.eagle:footprint:5381/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 4 mm, grid 5.08 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.524" x2="-3.683" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.778" x2="3.429" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.524" x2="3.683" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.778" x2="-3.429" y2="1.778" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.778" x2="3.683" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.778" x2="3.683" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.524" x2="-3.429" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.524" x2="-3.429" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="2.032" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B4.5" urn="urn:adsk.eagle:footprint:5382/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 4.5 mm, grid 5.08 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.032" x2="-3.683" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.286" x2="3.429" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.032" x2="3.683" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.286" x2="-3.429" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.286" x2="3.683" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-2.286" x2="3.683" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-2.032" x2="-3.429" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="2.032" x2="-3.429" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B5" urn="urn:adsk.eagle:footprint:5383/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 5 mm, grid 5.08 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.286" x2="-3.683" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.54" x2="3.429" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.286" x2="3.683" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.54" x2="-3.429" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.54" x2="3.683" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-2.54" x2="3.683" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-2.286" x2="-3.429" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="2.286" x2="-3.429" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.286" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B5.5" urn="urn:adsk.eagle:footprint:5384/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 5.5 mm, grid 5.08 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.54" x2="-3.683" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.794" x2="3.429" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.54" x2="3.683" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.794" x2="-3.429" y2="2.794" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.794" x2="3.683" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-2.794" x2="3.683" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-2.54" x2="-3.429" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="2.54" x2="-3.429" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.286" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C5B7.2" urn="urn:adsk.eagle:footprint:5385/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 7.5 x 7.2 mm, grid 5.08 mm</description>
<wire x1="-1.524" y1="0" x2="-0.4572" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.4572" y1="0" x2="-0.4572" y2="0.762" width="0.4064" layer="21"/>
<wire x1="-0.4572" y1="0" x2="-0.4572" y2="-0.762" width="0.4064" layer="21"/>
<wire x1="0.4318" y1="0.762" x2="0.4318" y2="0" width="0.4064" layer="21"/>
<wire x1="0.4318" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.4318" y1="0" x2="0.4318" y2="-0.762" width="0.4064" layer="21"/>
<wire x1="-3.683" y1="3.429" x2="-3.683" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-3.683" x2="3.429" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-3.429" x2="3.683" y2="3.429" width="0.1524" layer="21"/>
<wire x1="3.429" y1="3.683" x2="-3.429" y2="3.683" width="0.1524" layer="21"/>
<wire x1="3.429" y1="3.683" x2="3.683" y2="3.429" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-3.683" x2="3.683" y2="-3.429" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-3.429" x2="-3.429" y2="-3.683" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="3.429" x2="-3.429" y2="3.683" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-2.54" y="4.064" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C7.5B3" urn="urn:adsk.eagle:footprint:5386/1" library_version="2">
<description>&lt;B&gt;MKS3&lt;/B&gt;, 10 x 3 mm, grid 7.62 mm</description>
<wire x1="4.826" y1="1.524" x2="-4.826" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.524" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.27" x2="5.08" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.524" x2="5.08" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.826" y1="-1.524" x2="5.08" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="-1.27" x2="-4.826" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.27" x2="-4.826" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="0.508" y1="0" x2="2.54" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0" x2="-0.508" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0.889" x2="-0.508" y2="0" width="0.4064" layer="21"/>
<wire x1="-0.508" y1="0" x2="-0.508" y2="-0.889" width="0.4064" layer="21"/>
<wire x1="0.508" y1="0.889" x2="0.508" y2="0" width="0.4064" layer="21"/>
<wire x1="0.508" y1="0" x2="0.508" y2="-0.889" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<text x="-3.81" y="1.778" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C7.5B4" urn="urn:adsk.eagle:footprint:5387/1" library_version="2">
<description>&lt;B&gt;MKS3&lt;/B&gt;, 10 x 4 mm, grid 7.62 mm</description>
<wire x1="4.826" y1="2.032" x2="-4.826" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.778" x2="-5.08" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.032" x2="4.826" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.778" x2="5.08" y2="1.778" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="5.08" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.826" y1="-2.032" x2="5.08" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="-1.778" x2="-4.826" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.778" x2="-4.826" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="0" x2="2.667" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="0" x2="-2.159" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.27" x2="-2.159" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.159" y1="0" x2="-2.159" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<text x="-3.81" y="2.286" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-3.556" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C7.5B5" urn="urn:adsk.eagle:footprint:5388/1" library_version="2">
<description>&lt;B&gt;MKS3&lt;/B&gt;, 10 x 5 mm, grid 7.62 mm</description>
<wire x1="4.953" y1="2.54" x2="-4.953" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.286" x2="-5.207" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-2.54" x2="4.953" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.286" x2="5.207" y2="2.286" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.54" x2="5.207" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.953" y1="-2.54" x2="5.207" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="-2.286" x2="-4.953" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="2.286" x2="-4.953" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="0" x2="2.667" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="0" x2="-2.159" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.27" x2="-2.159" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.159" y1="0" x2="-2.159" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<text x="-3.81" y="2.794" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-4.064" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C7.5B6" urn="urn:adsk.eagle:footprint:5389/1" library_version="2">
<description>&lt;B&gt;MKS3&lt;/B&gt;, 10 x 6 mm, grid 7.62 mm</description>
<wire x1="4.953" y1="3.048" x2="-4.953" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.794" x2="-5.207" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-3.048" x2="4.953" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.794" x2="5.207" y2="2.794" width="0.1524" layer="21"/>
<wire x1="4.953" y1="3.048" x2="5.207" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.953" y1="-3.048" x2="5.207" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="-2.794" x2="-4.953" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="2.794" x2="-4.953" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="0" x2="2.667" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="0" x2="-2.159" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.27" x2="-2.159" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.159" y1="0" x2="-2.159" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" diameter="1.905" shape="octagon"/>
<text x="-3.683" y="3.302" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.889" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C2.5-3" urn="urn:adsk.eagle:footprint:5390/1" library_version="2">
<description>&lt;B&gt;MKS2&lt;/B&gt;, 5 x 3 mm, grid 2.54 mm</description>
<wire x1="-2.159" y1="1.524" x2="2.159" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.524" x2="-2.159" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.27" x2="2.413" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.27" x2="-2.413" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.524" x2="2.413" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.27" x2="-2.159" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.524" x2="2.413" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.27" x2="-2.159" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="1.27" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.6002" shape="octagon"/>
<text x="-1.651" y="1.778" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.651" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="C10B4" urn="urn:adsk.eagle:package:5400/1" type="box" library_version="2">
<description>MKS4, 13.4 x 4 mm, grid 10.16 mm</description>
<packageinstances>
<packageinstance name="C10B4"/>
</packageinstances>
</package3d>
<package3d name="C10B5" urn="urn:adsk.eagle:package:5399/1" type="box" library_version="2">
<description>MKS4, 13.4 x 5 mm, grid 10.16 mm</description>
<packageinstances>
<packageinstance name="C10B5"/>
</packageinstances>
</package3d>
<package3d name="C10B6" urn="urn:adsk.eagle:package:5401/1" type="box" library_version="2">
<description>MKS4, 13.4 x 6 mm, grid 10.16 mm</description>
<packageinstances>
<packageinstance name="C10B6"/>
</packageinstances>
</package3d>
<package3d name="C15B5" urn="urn:adsk.eagle:package:5402/1" type="box" library_version="2">
<description>MKS4, 18 x 5 mm, grid 15 mm</description>
<packageinstances>
<packageinstance name="C15B5"/>
</packageinstances>
</package3d>
<package3d name="C15B6" urn="urn:adsk.eagle:package:5403/1" type="box" library_version="2">
<description>MKS4, 18 x 6 mm, grid 15 mm</description>
<packageinstances>
<packageinstance name="C15B6"/>
</packageinstances>
</package3d>
<package3d name="C15B7" urn="urn:adsk.eagle:package:5404/1" type="box" library_version="2">
<description>MKS4, 18 x 7 mm, grid 15 mm</description>
<packageinstances>
<packageinstance name="C15B7"/>
</packageinstances>
</package3d>
<package3d name="C15B8" urn="urn:adsk.eagle:package:5409/1" type="box" library_version="2">
<description>MKS4, 18 x 8 mm, grid 15 mm</description>
<packageinstances>
<packageinstance name="C15B8"/>
</packageinstances>
</package3d>
<package3d name="C15B9" urn="urn:adsk.eagle:package:5405/1" type="box" library_version="2">
<description>MKS4, 18 x 9 mm, grid 15 mm</description>
<packageinstances>
<packageinstance name="C15B9"/>
</packageinstances>
</package3d>
<package3d name="C2.5-2" urn="urn:adsk.eagle:package:5415/1" type="box" library_version="2">
<description>MKS2, 5 x 2.5 mm, grid 2.54 mm</description>
<packageinstances>
<packageinstance name="C2.5-2"/>
</packageinstances>
</package3d>
<package3d name="C2.5-4" urn="urn:adsk.eagle:package:5408/1" type="box" library_version="2">
<description>MKS2, 5 x 4 mm, grid 2.54 mm</description>
<packageinstances>
<packageinstance name="C2.5-4"/>
</packageinstances>
</package3d>
<package3d name="C2.5-5" urn="urn:adsk.eagle:package:5407/1" type="box" library_version="2">
<description>MKS2, 5 x 5 mm, grid 2.54 mm</description>
<packageinstances>
<packageinstance name="C2.5-5"/>
</packageinstances>
</package3d>
<package3d name="C2.5-6" urn="urn:adsk.eagle:package:5406/1" type="box" library_version="2">
<description>MKS2, 5 x 6 mm, grid 2.54 mm</description>
<packageinstances>
<packageinstance name="C2.5-6"/>
</packageinstances>
</package3d>
<package3d name="C22.5B10" urn="urn:adsk.eagle:package:5411/1" type="box" library_version="2">
<description>MKS4, 27 x 10 mm, grid 22.5 mm</description>
<packageinstances>
<packageinstance name="C22.5B10"/>
</packageinstances>
</package3d>
<package3d name="C22.5B11" urn="urn:adsk.eagle:package:5412/1" type="box" library_version="2">
<description>MKS4, 27 x 11 mm, grid 22.5 mm</description>
<packageinstances>
<packageinstance name="C22.5B11"/>
</packageinstances>
</package3d>
<package3d name="C22.5B6" urn="urn:adsk.eagle:package:5410/1" type="box" library_version="2">
<description>MKS4, 27 x 6 mm, grid 22.5 mm</description>
<packageinstances>
<packageinstance name="C22.5B6"/>
</packageinstances>
</package3d>
<package3d name="C22.5B7" urn="urn:adsk.eagle:package:5414/1" type="box" library_version="2">
<description>MKS4, 27 x 7 mm, grid 22.5 mm</description>
<packageinstances>
<packageinstance name="C22.5B7"/>
</packageinstances>
</package3d>
<package3d name="C22.5B8" urn="urn:adsk.eagle:package:5413/1" type="box" library_version="2">
<description>MKS4, 27 x 8 mm, grid 22.5 mm</description>
<packageinstances>
<packageinstance name="C22.5B8"/>
</packageinstances>
</package3d>
<package3d name="C27.5B11" urn="urn:adsk.eagle:package:5416/1" type="box" library_version="2">
<description>MKS4, 31.6 x 11 mm, grid 27.5 mm</description>
<packageinstances>
<packageinstance name="C27.5B11"/>
</packageinstances>
</package3d>
<package3d name="C27.5B13" urn="urn:adsk.eagle:package:5420/1" type="box" library_version="2">
<description>MKS4, 31.6 x 13 mm, grid 27.5 mm</description>
<packageinstances>
<packageinstance name="C27.5B13"/>
</packageinstances>
</package3d>
<package3d name="C27.5B15" urn="urn:adsk.eagle:package:5417/1" type="box" library_version="2">
<description>MKS4, 31.6 x 15 mm, grid 27.5 mm</description>
<packageinstances>
<packageinstance name="C27.5B15"/>
</packageinstances>
</package3d>
<package3d name="C27.5B17" urn="urn:adsk.eagle:package:5418/1" type="box" library_version="2">
<description>MKS4, 31.6 x 17 mm, grid 27.5 mm</description>
<packageinstances>
<packageinstance name="C27.5B17"/>
</packageinstances>
</package3d>
<package3d name="C27.5B20" urn="urn:adsk.eagle:package:5421/1" type="box" library_version="2">
<description>MKS4, 31.6 x 20 mm, grid 27.5 mm</description>
<packageinstances>
<packageinstance name="C27.5B20"/>
</packageinstances>
</package3d>
<package3d name="C27.5B9" urn="urn:adsk.eagle:package:5419/1" type="box" library_version="2">
<description>MKS4, 31.6 x 9 mm, grid 27.5 mm</description>
<packageinstances>
<packageinstance name="C27.5B9"/>
</packageinstances>
</package3d>
<package3d name="C37.5B15" urn="urn:adsk.eagle:package:5425/1" type="box" library_version="2">
<description>MKP4, 42 x 15 mm, grid 37.5 mm</description>
<packageinstances>
<packageinstance name="C37.5B15"/>
</packageinstances>
</package3d>
<package3d name="C37.5B19" urn="urn:adsk.eagle:package:5422/1" type="box" library_version="2">
<description>MKP4, 42 x 19 mm, grid 37.5 mm</description>
<packageinstances>
<packageinstance name="C37.5B19"/>
</packageinstances>
</package3d>
<package3d name="C37.5B20" urn="urn:adsk.eagle:package:5423/1" type="box" library_version="2">
<description>MKP4, 42 x 20 mm, grid 37.5 mm</description>
<packageinstances>
<packageinstance name="C37.5B20"/>
</packageinstances>
</package3d>
<package3d name="C5B2.5" urn="urn:adsk.eagle:package:5426/1" type="box" library_version="2">
<description>MKS2, 7.5 x 2.5 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B2.5"/>
</packageinstances>
</package3d>
<package3d name="C5B3" urn="urn:adsk.eagle:package:5433/1" type="box" library_version="2">
<description>MKS2, 7.5 x 3 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B3"/>
</packageinstances>
</package3d>
<package3d name="C5B3.5" urn="urn:adsk.eagle:package:5427/1" type="box" library_version="2">
<description>MKS2, 7.5 x 4 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B3.5"/>
</packageinstances>
</package3d>
<package3d name="C5B4.5" urn="urn:adsk.eagle:package:5424/1" type="box" library_version="2">
<description>MKS2, 7.5 x 4.5 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B4.5"/>
</packageinstances>
</package3d>
<package3d name="C5B5" urn="urn:adsk.eagle:package:5428/1" type="box" library_version="2">
<description>MKS2, 7.5 x 5 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B5"/>
</packageinstances>
</package3d>
<package3d name="C5B5.5" urn="urn:adsk.eagle:package:5429/1" type="box" library_version="2">
<description>MKS2, 7.5 x 5.5 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B5.5"/>
</packageinstances>
</package3d>
<package3d name="C5B7.2" urn="urn:adsk.eagle:package:5430/1" type="box" library_version="2">
<description>MKS2, 7.5 x 7.2 mm, grid 5.08 mm</description>
<packageinstances>
<packageinstance name="C5B7.2"/>
</packageinstances>
</package3d>
<package3d name="C7.5B3" urn="urn:adsk.eagle:package:5434/1" type="box" library_version="2">
<description>MKS3, 10 x 3 mm, grid 7.62 mm</description>
<packageinstances>
<packageinstance name="C7.5B3"/>
</packageinstances>
</package3d>
<package3d name="C7.5B4" urn="urn:adsk.eagle:package:5431/1" type="box" library_version="2">
<description>MKS3, 10 x 4 mm, grid 7.62 mm</description>
<packageinstances>
<packageinstance name="C7.5B4"/>
</packageinstances>
</package3d>
<package3d name="C7.5B5" urn="urn:adsk.eagle:package:5432/1" type="box" library_version="2">
<description>MKS3, 10 x 5 mm, grid 7.62 mm</description>
<packageinstances>
<packageinstance name="C7.5B5"/>
</packageinstances>
</package3d>
<package3d name="C7.5B6" urn="urn:adsk.eagle:package:5435/1" type="box" library_version="2">
<description>MKS3, 10 x 6 mm, grid 7.62 mm</description>
<packageinstances>
<packageinstance name="C7.5B6"/>
</packageinstances>
</package3d>
<package3d name="C2.5-3" urn="urn:adsk.eagle:package:5436/1" type="box" library_version="2">
<description>MKS2, 5 x 3 mm, grid 2.54 mm</description>
<packageinstances>
<packageinstance name="C2.5-3"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="C" urn="urn:adsk.eagle:symbol:5352/1" library_version="2">
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-4.699" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C" urn="urn:adsk.eagle:component:5444/2" prefix="C" uservalue="yes" library_version="2">
<description>&lt;B&gt;CAPACITOR&lt;/B&gt;&lt;p&gt;
naming: grid - package width</description>
<gates>
<gate name="G$1" symbol="C" x="0" y="0"/>
</gates>
<devices>
<device name="10/4" package="C10B4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5400/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="10/5" package="C10B5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5399/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="10/6" package="C10B6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5401/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="15/5" package="C15B5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5402/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="15/6" package="C15B6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5403/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="15/7" package="C15B7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5404/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="15/8" package="C15B8">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5409/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="2" constant="no"/>
</technology>
</technologies>
</device>
<device name="15/9" package="C15B9">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5405/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="2.5/2" package="C2.5-2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5415/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="28" constant="no"/>
</technology>
</technologies>
</device>
<device name="2.5/4" package="C2.5-4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5408/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="6" constant="no"/>
</technology>
</technologies>
</device>
<device name="2.5/5" package="C2.5-5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5407/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="2.5/6" package="C2.5-6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5406/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="4" constant="no"/>
</technology>
</technologies>
</device>
<device name="22/10" package="C22.5B10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5411/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="22/11" package="C22.5B11">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5412/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="22/6" package="C22.5B6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5410/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="22/7" package="C22.5B7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5414/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="22/8" package="C22.5B8">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5413/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="27/11" package="C27.5B11">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5416/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="27/13" package="C27.5B13">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5420/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="27/15" package="C27.5B15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5417/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="27/17" package="C27.5B17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5418/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="27/20" package="C27.5B20">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5421/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="27/9" package="C27.5B9">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5419/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="37/15" package="C37.5B15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5425/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="37/19" package="C37.5B19">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5422/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="37/20" package="C37.5B20">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5423/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/2.5" package="C5B2.5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5426/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="10" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/3" package="C5B3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5433/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="4" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/3.5" package="C5B3.5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5427/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="3" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/4.5" package="C5B4.5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5424/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/5" package="C5B5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5428/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/5.5" package="C5B5.5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5429/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="5/7.2" package="C5B7.2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5430/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="7.5/3" package="C7.5B3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5434/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="5" constant="no"/>
</technology>
</technologies>
</device>
<device name="7.5/4" package="C7.5B4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5431/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="7.5/5" package="C7.5B5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5432/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="7.5/6" package="C7.5B6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5435/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="2,5-3" package="C2.5-3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:5436/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="38" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X1" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X2" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X3" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X4" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC2" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X5" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X6" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X7" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X8" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC3" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X9" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X10" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X11" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X12" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC4" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X13" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X14" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X15" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X16" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC5" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X17" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X18" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X19" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X20" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC6" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X21" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X22" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X23" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X24" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC7" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X25" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X26" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X27" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X28" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC8" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X29" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X30" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X31" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X32" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="IC9" library="ic-package" library_urn="urn:adsk.eagle:library:239" deviceset="DIL20" device="" package3d_urn="urn:adsk.eagle:package:16429/2"/>
<part name="X33" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X34" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2061" device="" package3d_urn="urn:adsk.eagle:package:8078637/1"/>
<part name="X35" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X36" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2021" device="" package3d_urn="urn:adsk.eagle:package:8078633/1"/>
<part name="X37" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2081" device="" package3d_urn="urn:adsk.eagle:package:8078639/1"/>
<part name="X38" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2081" device="" package3d_urn="urn:adsk.eagle:package:8078639/1"/>
<part name="X39" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2081" device="" package3d_urn="urn:adsk.eagle:package:8078639/1"/>
<part name="X40" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="22-23-2081" device="" package3d_urn="urn:adsk.eagle:package:8078639/1"/>
<part name="C1" library="capacitor-wima" library_urn="urn:adsk.eagle:library:116" deviceset="C" device="2.5/2" package3d_urn="urn:adsk.eagle:package:5415/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="10.16" y="76.2" smashed="yes">
<attribute name="NAME" x="5.715" y="88.265" size="1.778" layer="95"/>
<attribute name="VALUE" x="5.715" y="59.69" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="-1" x="35.56" y="78.74" smashed="yes">
<attribute name="NAME" x="38.1" y="77.978" size="1.524" layer="95"/>
<attribute name="VALUE" x="34.798" y="80.137" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="-2" x="35.56" y="76.2" smashed="yes">
<attribute name="NAME" x="38.1" y="75.438" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-3" x="35.56" y="73.66" smashed="yes">
<attribute name="NAME" x="38.1" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-4" x="35.56" y="71.12" smashed="yes">
<attribute name="NAME" x="38.1" y="70.358" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-5" x="35.56" y="68.58" smashed="yes">
<attribute name="NAME" x="38.1" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-6" x="35.56" y="66.04" smashed="yes">
<attribute name="NAME" x="38.1" y="65.278" size="1.524" layer="95"/>
</instance>
<instance part="X2" gate="-1" x="-15.24" y="78.74" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="79.502" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="-14.478" y="77.343" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X2" gate="-2" x="-15.24" y="76.2" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="76.962" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X2" gate="-3" x="-15.24" y="73.66" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="74.422" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X2" gate="-4" x="-15.24" y="71.12" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="71.882" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X2" gate="-5" x="-15.24" y="68.58" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="69.342" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X2" gate="-6" x="-15.24" y="66.04" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="66.802" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X3" gate="-1" x="35.56" y="60.96" smashed="yes">
<attribute name="NAME" x="38.1" y="60.198" size="1.524" layer="95"/>
</instance>
<instance part="X3" gate="-2" x="35.56" y="58.42" smashed="yes">
<attribute name="NAME" x="38.1" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X4" gate="-1" x="-15.24" y="60.96" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="61.722" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X4" gate="-2" x="-15.24" y="58.42" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="59.182" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC2" gate="G$1" x="86.36" y="76.2" smashed="yes">
<attribute name="NAME" x="81.915" y="88.265" size="1.778" layer="95"/>
<attribute name="VALUE" x="81.915" y="59.69" size="1.778" layer="96"/>
</instance>
<instance part="X5" gate="-1" x="111.76" y="78.74" smashed="yes">
<attribute name="NAME" x="114.3" y="77.978" size="1.524" layer="95"/>
<attribute name="VALUE" x="110.998" y="80.137" size="1.778" layer="96"/>
</instance>
<instance part="X5" gate="-2" x="111.76" y="76.2" smashed="yes">
<attribute name="NAME" x="114.3" y="75.438" size="1.524" layer="95"/>
</instance>
<instance part="X5" gate="-3" x="111.76" y="73.66" smashed="yes">
<attribute name="NAME" x="114.3" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X5" gate="-4" x="111.76" y="71.12" smashed="yes">
<attribute name="NAME" x="114.3" y="70.358" size="1.524" layer="95"/>
</instance>
<instance part="X5" gate="-5" x="111.76" y="68.58" smashed="yes">
<attribute name="NAME" x="114.3" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X5" gate="-6" x="111.76" y="66.04" smashed="yes">
<attribute name="NAME" x="114.3" y="65.278" size="1.524" layer="95"/>
</instance>
<instance part="X6" gate="-1" x="60.96" y="78.74" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="79.502" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="61.722" y="77.343" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X6" gate="-2" x="60.96" y="76.2" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="76.962" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X6" gate="-3" x="60.96" y="73.66" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="74.422" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X6" gate="-4" x="60.96" y="71.12" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="71.882" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X6" gate="-5" x="60.96" y="68.58" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="69.342" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X6" gate="-6" x="60.96" y="66.04" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="66.802" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X7" gate="-1" x="111.76" y="60.96" smashed="yes">
<attribute name="NAME" x="114.3" y="60.198" size="1.524" layer="95"/>
</instance>
<instance part="X7" gate="-2" x="111.76" y="58.42" smashed="yes">
<attribute name="NAME" x="114.3" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X8" gate="-1" x="60.96" y="60.96" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="61.722" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X8" gate="-2" x="60.96" y="58.42" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="59.182" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC3" gate="G$1" x="165.1" y="76.2" smashed="yes">
<attribute name="NAME" x="160.655" y="88.265" size="1.778" layer="95"/>
<attribute name="VALUE" x="160.655" y="59.69" size="1.778" layer="96"/>
</instance>
<instance part="X9" gate="-1" x="190.5" y="78.74" smashed="yes">
<attribute name="NAME" x="193.04" y="77.978" size="1.524" layer="95"/>
<attribute name="VALUE" x="189.738" y="80.137" size="1.778" layer="96"/>
</instance>
<instance part="X9" gate="-2" x="190.5" y="76.2" smashed="yes">
<attribute name="NAME" x="193.04" y="75.438" size="1.524" layer="95"/>
</instance>
<instance part="X9" gate="-3" x="190.5" y="73.66" smashed="yes">
<attribute name="NAME" x="193.04" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X9" gate="-4" x="190.5" y="71.12" smashed="yes">
<attribute name="NAME" x="193.04" y="70.358" size="1.524" layer="95"/>
</instance>
<instance part="X9" gate="-5" x="190.5" y="68.58" smashed="yes">
<attribute name="NAME" x="193.04" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X9" gate="-6" x="190.5" y="66.04" smashed="yes">
<attribute name="NAME" x="193.04" y="65.278" size="1.524" layer="95"/>
</instance>
<instance part="X10" gate="-1" x="139.7" y="78.74" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="79.502" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="140.462" y="77.343" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X10" gate="-2" x="139.7" y="76.2" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="76.962" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X10" gate="-3" x="139.7" y="73.66" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="74.422" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X10" gate="-4" x="139.7" y="71.12" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="71.882" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X10" gate="-5" x="139.7" y="68.58" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="69.342" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X10" gate="-6" x="139.7" y="66.04" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="66.802" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X11" gate="-1" x="190.5" y="60.96" smashed="yes">
<attribute name="NAME" x="193.04" y="60.198" size="1.524" layer="95"/>
</instance>
<instance part="X11" gate="-2" x="190.5" y="58.42" smashed="yes">
<attribute name="NAME" x="193.04" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X12" gate="-1" x="139.7" y="60.96" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="61.722" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X12" gate="-2" x="139.7" y="58.42" smashed="yes" rot="R180">
<attribute name="NAME" x="137.16" y="59.182" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC4" gate="G$1" x="10.16" y="27.94" smashed="yes">
<attribute name="NAME" x="5.715" y="40.005" size="1.778" layer="95"/>
<attribute name="VALUE" x="5.715" y="11.43" size="1.778" layer="96"/>
</instance>
<instance part="X13" gate="-1" x="35.56" y="30.48" smashed="yes">
<attribute name="NAME" x="38.1" y="29.718" size="1.524" layer="95"/>
<attribute name="VALUE" x="34.798" y="31.877" size="1.778" layer="96"/>
</instance>
<instance part="X13" gate="-2" x="35.56" y="27.94" smashed="yes">
<attribute name="NAME" x="38.1" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="X13" gate="-3" x="35.56" y="25.4" smashed="yes">
<attribute name="NAME" x="38.1" y="24.638" size="1.524" layer="95"/>
</instance>
<instance part="X13" gate="-4" x="35.56" y="22.86" smashed="yes">
<attribute name="NAME" x="38.1" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="X13" gate="-5" x="35.56" y="20.32" smashed="yes">
<attribute name="NAME" x="38.1" y="19.558" size="1.524" layer="95"/>
</instance>
<instance part="X13" gate="-6" x="35.56" y="17.78" smashed="yes">
<attribute name="NAME" x="38.1" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="X14" gate="-1" x="-15.24" y="30.48" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="31.242" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="-14.478" y="29.083" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X14" gate="-2" x="-15.24" y="27.94" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="28.702" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X14" gate="-3" x="-15.24" y="25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="26.162" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X14" gate="-4" x="-15.24" y="22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="23.622" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X14" gate="-5" x="-15.24" y="20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="21.082" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X14" gate="-6" x="-15.24" y="17.78" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="18.542" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X15" gate="-1" x="35.56" y="12.7" smashed="yes">
<attribute name="NAME" x="38.1" y="11.938" size="1.524" layer="95"/>
</instance>
<instance part="X15" gate="-2" x="35.56" y="10.16" smashed="yes">
<attribute name="NAME" x="38.1" y="9.398" size="1.524" layer="95"/>
</instance>
<instance part="X16" gate="-1" x="-15.24" y="12.7" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="13.462" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X16" gate="-2" x="-15.24" y="10.16" smashed="yes" rot="R180">
<attribute name="NAME" x="-17.78" y="10.922" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC5" gate="G$1" x="86.36" y="27.94" smashed="yes">
<attribute name="NAME" x="81.915" y="40.005" size="1.778" layer="95"/>
<attribute name="VALUE" x="81.915" y="11.43" size="1.778" layer="96"/>
</instance>
<instance part="X17" gate="-1" x="111.76" y="30.48" smashed="yes">
<attribute name="NAME" x="114.3" y="29.718" size="1.524" layer="95"/>
<attribute name="VALUE" x="110.998" y="31.877" size="1.778" layer="96"/>
</instance>
<instance part="X17" gate="-2" x="111.76" y="27.94" smashed="yes">
<attribute name="NAME" x="114.3" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="X17" gate="-3" x="111.76" y="25.4" smashed="yes">
<attribute name="NAME" x="114.3" y="24.638" size="1.524" layer="95"/>
</instance>
<instance part="X17" gate="-4" x="111.76" y="22.86" smashed="yes">
<attribute name="NAME" x="114.3" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="X17" gate="-5" x="111.76" y="20.32" smashed="yes">
<attribute name="NAME" x="114.3" y="19.558" size="1.524" layer="95"/>
</instance>
<instance part="X17" gate="-6" x="111.76" y="17.78" smashed="yes">
<attribute name="NAME" x="114.3" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="X18" gate="-1" x="60.96" y="30.48" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="31.242" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="61.722" y="29.083" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X18" gate="-2" x="60.96" y="27.94" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="28.702" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X18" gate="-3" x="60.96" y="25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="26.162" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X18" gate="-4" x="60.96" y="22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="23.622" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X18" gate="-5" x="60.96" y="20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="21.082" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X18" gate="-6" x="60.96" y="17.78" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="18.542" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X19" gate="-1" x="111.76" y="12.7" smashed="yes">
<attribute name="NAME" x="114.3" y="11.938" size="1.524" layer="95"/>
</instance>
<instance part="X19" gate="-2" x="111.76" y="10.16" smashed="yes">
<attribute name="NAME" x="114.3" y="9.398" size="1.524" layer="95"/>
</instance>
<instance part="X20" gate="-1" x="60.96" y="12.7" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="13.462" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X20" gate="-2" x="60.96" y="10.16" smashed="yes" rot="R180">
<attribute name="NAME" x="58.42" y="10.922" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC6" gate="G$1" x="167.64" y="27.94" smashed="yes">
<attribute name="NAME" x="163.195" y="40.005" size="1.778" layer="95"/>
<attribute name="VALUE" x="163.195" y="11.43" size="1.778" layer="96"/>
</instance>
<instance part="X21" gate="-1" x="193.04" y="30.48" smashed="yes">
<attribute name="NAME" x="195.58" y="29.718" size="1.524" layer="95"/>
<attribute name="VALUE" x="192.278" y="31.877" size="1.778" layer="96"/>
</instance>
<instance part="X21" gate="-2" x="193.04" y="27.94" smashed="yes">
<attribute name="NAME" x="195.58" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="X21" gate="-3" x="193.04" y="25.4" smashed="yes">
<attribute name="NAME" x="195.58" y="24.638" size="1.524" layer="95"/>
</instance>
<instance part="X21" gate="-4" x="193.04" y="22.86" smashed="yes">
<attribute name="NAME" x="195.58" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="X21" gate="-5" x="193.04" y="20.32" smashed="yes">
<attribute name="NAME" x="195.58" y="19.558" size="1.524" layer="95"/>
</instance>
<instance part="X21" gate="-6" x="193.04" y="17.78" smashed="yes">
<attribute name="NAME" x="195.58" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="X22" gate="-1" x="142.24" y="30.48" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="31.242" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="143.002" y="29.083" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X22" gate="-2" x="142.24" y="27.94" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="28.702" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X22" gate="-3" x="142.24" y="25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="26.162" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X22" gate="-4" x="142.24" y="22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="23.622" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X22" gate="-5" x="142.24" y="20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="21.082" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X22" gate="-6" x="142.24" y="17.78" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="18.542" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X23" gate="-1" x="193.04" y="12.7" smashed="yes">
<attribute name="NAME" x="195.58" y="11.938" size="1.524" layer="95"/>
</instance>
<instance part="X23" gate="-2" x="193.04" y="10.16" smashed="yes">
<attribute name="NAME" x="195.58" y="9.398" size="1.524" layer="95"/>
</instance>
<instance part="X24" gate="-1" x="142.24" y="12.7" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="13.462" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X24" gate="-2" x="142.24" y="10.16" smashed="yes" rot="R180">
<attribute name="NAME" x="139.7" y="10.922" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC7" gate="G$1" x="7.62" y="-22.86" smashed="yes">
<attribute name="NAME" x="3.175" y="-10.795" size="1.778" layer="95"/>
<attribute name="VALUE" x="3.175" y="-39.37" size="1.778" layer="96"/>
</instance>
<instance part="X25" gate="-1" x="33.02" y="-20.32" smashed="yes">
<attribute name="NAME" x="35.56" y="-21.082" size="1.524" layer="95"/>
<attribute name="VALUE" x="32.258" y="-18.923" size="1.778" layer="96"/>
</instance>
<instance part="X25" gate="-2" x="33.02" y="-22.86" smashed="yes">
<attribute name="NAME" x="35.56" y="-23.622" size="1.524" layer="95"/>
</instance>
<instance part="X25" gate="-3" x="33.02" y="-25.4" smashed="yes">
<attribute name="NAME" x="35.56" y="-26.162" size="1.524" layer="95"/>
</instance>
<instance part="X25" gate="-4" x="33.02" y="-27.94" smashed="yes">
<attribute name="NAME" x="35.56" y="-28.702" size="1.524" layer="95"/>
</instance>
<instance part="X25" gate="-5" x="33.02" y="-30.48" smashed="yes">
<attribute name="NAME" x="35.56" y="-31.242" size="1.524" layer="95"/>
</instance>
<instance part="X25" gate="-6" x="33.02" y="-33.02" smashed="yes">
<attribute name="NAME" x="35.56" y="-33.782" size="1.524" layer="95"/>
</instance>
<instance part="X26" gate="-1" x="-17.78" y="-20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-19.558" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="-17.018" y="-21.717" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X26" gate="-2" x="-17.78" y="-22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-22.098" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X26" gate="-3" x="-17.78" y="-25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-24.638" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X26" gate="-4" x="-17.78" y="-27.94" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-27.178" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X26" gate="-5" x="-17.78" y="-30.48" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-29.718" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X26" gate="-6" x="-17.78" y="-33.02" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-32.258" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X27" gate="-1" x="33.02" y="-38.1" smashed="yes">
<attribute name="NAME" x="35.56" y="-38.862" size="1.524" layer="95"/>
</instance>
<instance part="X27" gate="-2" x="33.02" y="-40.64" smashed="yes">
<attribute name="NAME" x="35.56" y="-41.402" size="1.524" layer="95"/>
</instance>
<instance part="X28" gate="-1" x="-17.78" y="-38.1" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-37.338" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X28" gate="-2" x="-17.78" y="-40.64" smashed="yes" rot="R180">
<attribute name="NAME" x="-20.32" y="-39.878" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC8" gate="G$1" x="88.9" y="-22.86" smashed="yes">
<attribute name="NAME" x="84.455" y="-10.795" size="1.778" layer="95"/>
<attribute name="VALUE" x="84.455" y="-39.37" size="1.778" layer="96"/>
</instance>
<instance part="X29" gate="-1" x="114.3" y="-20.32" smashed="yes">
<attribute name="NAME" x="116.84" y="-21.082" size="1.524" layer="95"/>
<attribute name="VALUE" x="113.538" y="-18.923" size="1.778" layer="96"/>
</instance>
<instance part="X29" gate="-2" x="114.3" y="-22.86" smashed="yes">
<attribute name="NAME" x="116.84" y="-23.622" size="1.524" layer="95"/>
</instance>
<instance part="X29" gate="-3" x="114.3" y="-25.4" smashed="yes">
<attribute name="NAME" x="116.84" y="-26.162" size="1.524" layer="95"/>
</instance>
<instance part="X29" gate="-4" x="114.3" y="-27.94" smashed="yes">
<attribute name="NAME" x="116.84" y="-28.702" size="1.524" layer="95"/>
</instance>
<instance part="X29" gate="-5" x="114.3" y="-30.48" smashed="yes">
<attribute name="NAME" x="116.84" y="-31.242" size="1.524" layer="95"/>
</instance>
<instance part="X29" gate="-6" x="114.3" y="-33.02" smashed="yes">
<attribute name="NAME" x="116.84" y="-33.782" size="1.524" layer="95"/>
</instance>
<instance part="X30" gate="-1" x="63.5" y="-20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-19.558" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="64.262" y="-21.717" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X30" gate="-2" x="63.5" y="-22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-22.098" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X30" gate="-3" x="63.5" y="-25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-24.638" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X30" gate="-4" x="63.5" y="-27.94" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-27.178" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X30" gate="-5" x="63.5" y="-30.48" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-29.718" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X30" gate="-6" x="63.5" y="-33.02" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-32.258" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X31" gate="-1" x="114.3" y="-38.1" smashed="yes">
<attribute name="NAME" x="116.84" y="-38.862" size="1.524" layer="95"/>
</instance>
<instance part="X31" gate="-2" x="114.3" y="-40.64" smashed="yes">
<attribute name="NAME" x="116.84" y="-41.402" size="1.524" layer="95"/>
</instance>
<instance part="X32" gate="-1" x="63.5" y="-38.1" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-37.338" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X32" gate="-2" x="63.5" y="-40.64" smashed="yes" rot="R180">
<attribute name="NAME" x="60.96" y="-39.878" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="IC9" gate="G$1" x="172.72" y="-22.86" smashed="yes">
<attribute name="NAME" x="168.275" y="-10.795" size="1.778" layer="95"/>
<attribute name="VALUE" x="168.275" y="-39.37" size="1.778" layer="96"/>
</instance>
<instance part="X33" gate="-1" x="198.12" y="-20.32" smashed="yes">
<attribute name="NAME" x="200.66" y="-21.082" size="1.524" layer="95"/>
<attribute name="VALUE" x="197.358" y="-18.923" size="1.778" layer="96"/>
</instance>
<instance part="X33" gate="-2" x="198.12" y="-22.86" smashed="yes">
<attribute name="NAME" x="200.66" y="-23.622" size="1.524" layer="95"/>
</instance>
<instance part="X33" gate="-3" x="198.12" y="-25.4" smashed="yes">
<attribute name="NAME" x="200.66" y="-26.162" size="1.524" layer="95"/>
</instance>
<instance part="X33" gate="-4" x="198.12" y="-27.94" smashed="yes">
<attribute name="NAME" x="200.66" y="-28.702" size="1.524" layer="95"/>
</instance>
<instance part="X33" gate="-5" x="198.12" y="-30.48" smashed="yes">
<attribute name="NAME" x="200.66" y="-31.242" size="1.524" layer="95"/>
</instance>
<instance part="X33" gate="-6" x="198.12" y="-33.02" smashed="yes">
<attribute name="NAME" x="200.66" y="-33.782" size="1.524" layer="95"/>
</instance>
<instance part="X34" gate="-1" x="147.32" y="-20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-19.558" size="1.524" layer="95" rot="R180"/>
<attribute name="VALUE" x="148.082" y="-21.717" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="X34" gate="-2" x="147.32" y="-22.86" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-22.098" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X34" gate="-3" x="147.32" y="-25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-24.638" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X34" gate="-4" x="147.32" y="-27.94" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-27.178" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X34" gate="-5" x="147.32" y="-30.48" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-29.718" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X34" gate="-6" x="147.32" y="-33.02" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-32.258" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X35" gate="-1" x="198.12" y="-38.1" smashed="yes">
<attribute name="NAME" x="200.66" y="-38.862" size="1.524" layer="95"/>
</instance>
<instance part="X35" gate="-2" x="198.12" y="-40.64" smashed="yes">
<attribute name="NAME" x="200.66" y="-41.402" size="1.524" layer="95"/>
</instance>
<instance part="X36" gate="-1" x="147.32" y="-38.1" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-37.338" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X36" gate="-2" x="147.32" y="-40.64" smashed="yes" rot="R180">
<attribute name="NAME" x="144.78" y="-39.878" size="1.524" layer="95" rot="R180"/>
</instance>
<instance part="X37" gate="-1" x="-22.86" y="-63.5" smashed="yes">
<attribute name="NAME" x="-20.32" y="-64.262" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-2" x="-22.86" y="-66.04" smashed="yes">
<attribute name="NAME" x="-20.32" y="-66.802" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-3" x="-22.86" y="-68.58" smashed="yes">
<attribute name="NAME" x="-20.32" y="-69.342" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-4" x="-22.86" y="-71.12" smashed="yes">
<attribute name="NAME" x="-20.32" y="-71.882" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-5" x="-22.86" y="-73.66" smashed="yes">
<attribute name="NAME" x="-20.32" y="-74.422" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-6" x="-22.86" y="-76.2" smashed="yes">
<attribute name="NAME" x="-20.32" y="-76.962" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-7" x="-22.86" y="-78.74" smashed="yes">
<attribute name="NAME" x="-20.32" y="-79.502" size="1.524" layer="95"/>
</instance>
<instance part="X37" gate="-8" x="-22.86" y="-81.28" smashed="yes">
<attribute name="NAME" x="-20.32" y="-82.042" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-1" x="-2.54" y="-63.5" smashed="yes">
<attribute name="NAME" x="0" y="-64.262" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-2" x="-2.54" y="-66.04" smashed="yes">
<attribute name="NAME" x="0" y="-66.802" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-3" x="-2.54" y="-68.58" smashed="yes">
<attribute name="NAME" x="0" y="-69.342" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-4" x="-2.54" y="-71.12" smashed="yes">
<attribute name="NAME" x="0" y="-71.882" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-5" x="-2.54" y="-73.66" smashed="yes">
<attribute name="NAME" x="0" y="-74.422" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-6" x="-2.54" y="-76.2" smashed="yes">
<attribute name="NAME" x="0" y="-76.962" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-7" x="-2.54" y="-78.74" smashed="yes">
<attribute name="NAME" x="0" y="-79.502" size="1.524" layer="95"/>
</instance>
<instance part="X38" gate="-8" x="-2.54" y="-81.28" smashed="yes">
<attribute name="NAME" x="0" y="-82.042" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-1" x="15.24" y="-63.5" smashed="yes">
<attribute name="NAME" x="17.78" y="-64.262" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-2" x="15.24" y="-66.04" smashed="yes">
<attribute name="NAME" x="17.78" y="-66.802" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-3" x="15.24" y="-68.58" smashed="yes">
<attribute name="NAME" x="17.78" y="-69.342" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-4" x="15.24" y="-71.12" smashed="yes">
<attribute name="NAME" x="17.78" y="-71.882" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-5" x="15.24" y="-73.66" smashed="yes">
<attribute name="NAME" x="17.78" y="-74.422" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-6" x="15.24" y="-76.2" smashed="yes">
<attribute name="NAME" x="17.78" y="-76.962" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-7" x="15.24" y="-78.74" smashed="yes">
<attribute name="NAME" x="17.78" y="-79.502" size="1.524" layer="95"/>
</instance>
<instance part="X39" gate="-8" x="15.24" y="-81.28" smashed="yes">
<attribute name="NAME" x="17.78" y="-82.042" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-1" x="38.1" y="-63.5" smashed="yes">
<attribute name="NAME" x="40.64" y="-64.262" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-2" x="38.1" y="-66.04" smashed="yes">
<attribute name="NAME" x="40.64" y="-66.802" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-3" x="38.1" y="-68.58" smashed="yes">
<attribute name="NAME" x="40.64" y="-69.342" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-4" x="38.1" y="-71.12" smashed="yes">
<attribute name="NAME" x="40.64" y="-71.882" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-5" x="38.1" y="-73.66" smashed="yes">
<attribute name="NAME" x="40.64" y="-74.422" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-6" x="38.1" y="-76.2" smashed="yes">
<attribute name="NAME" x="40.64" y="-76.962" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-7" x="38.1" y="-78.74" smashed="yes">
<attribute name="NAME" x="40.64" y="-79.502" size="1.524" layer="95"/>
</instance>
<instance part="X40" gate="-8" x="38.1" y="-81.28" smashed="yes">
<attribute name="NAME" x="40.64" y="-82.042" size="1.524" layer="95"/>
</instance>
<instance part="C1" gate="G$1" x="81.28" y="-63.5" smashed="yes">
<attribute name="NAME" x="82.804" y="-63.119" size="1.778" layer="95"/>
<attribute name="VALUE" x="82.804" y="-68.199" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="11"/>
<wire x1="17.78" y1="63.5" x2="25.4" y2="63.5" width="0.1524" layer="91"/>
<label x="20.32" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="10"/>
<wire x1="2.54" y1="63.5" x2="-5.08" y2="63.5" width="0.1524" layer="91"/>
<label x="-5.08" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="19"/>
<wire x1="17.78" y1="83.82" x2="25.4" y2="83.82" width="0.1524" layer="91"/>
<label x="20.32" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="11"/>
<wire x1="93.98" y1="63.5" x2="101.6" y2="63.5" width="0.1524" layer="91"/>
<label x="96.52" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="10"/>
<wire x1="78.74" y1="63.5" x2="71.12" y2="63.5" width="0.1524" layer="91"/>
<label x="71.12" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="19"/>
<wire x1="93.98" y1="83.82" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
<label x="96.52" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="11"/>
<wire x1="172.72" y1="63.5" x2="180.34" y2="63.5" width="0.1524" layer="91"/>
<label x="175.26" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="10"/>
<wire x1="157.48" y1="63.5" x2="149.86" y2="63.5" width="0.1524" layer="91"/>
<label x="149.86" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="19"/>
<wire x1="172.72" y1="83.82" x2="180.34" y2="83.82" width="0.1524" layer="91"/>
<label x="175.26" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="11"/>
<wire x1="17.78" y1="15.24" x2="25.4" y2="15.24" width="0.1524" layer="91"/>
<label x="20.32" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="10"/>
<wire x1="2.54" y1="15.24" x2="-5.08" y2="15.24" width="0.1524" layer="91"/>
<label x="-5.08" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="19"/>
<wire x1="17.78" y1="35.56" x2="25.4" y2="35.56" width="0.1524" layer="91"/>
<label x="20.32" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="11"/>
<wire x1="93.98" y1="15.24" x2="101.6" y2="15.24" width="0.1524" layer="91"/>
<label x="96.52" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="10"/>
<wire x1="78.74" y1="15.24" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<label x="71.12" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="19"/>
<wire x1="93.98" y1="35.56" x2="101.6" y2="35.56" width="0.1524" layer="91"/>
<label x="96.52" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="11"/>
<wire x1="175.26" y1="15.24" x2="182.88" y2="15.24" width="0.1524" layer="91"/>
<label x="177.8" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="10"/>
<wire x1="160.02" y1="15.24" x2="152.4" y2="15.24" width="0.1524" layer="91"/>
<label x="152.4" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="19"/>
<wire x1="175.26" y1="35.56" x2="182.88" y2="35.56" width="0.1524" layer="91"/>
<label x="177.8" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="11"/>
<wire x1="15.24" y1="-35.56" x2="22.86" y2="-35.56" width="0.1524" layer="91"/>
<label x="17.78" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="10"/>
<wire x1="0" y1="-35.56" x2="-7.62" y2="-35.56" width="0.1524" layer="91"/>
<label x="-7.62" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="19"/>
<wire x1="15.24" y1="-15.24" x2="22.86" y2="-15.24" width="0.1524" layer="91"/>
<label x="17.78" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="11"/>
<wire x1="96.52" y1="-35.56" x2="104.14" y2="-35.56" width="0.1524" layer="91"/>
<label x="99.06" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="10"/>
<wire x1="81.28" y1="-35.56" x2="73.66" y2="-35.56" width="0.1524" layer="91"/>
<label x="73.66" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="19"/>
<wire x1="96.52" y1="-15.24" x2="104.14" y2="-15.24" width="0.1524" layer="91"/>
<label x="99.06" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="11"/>
<wire x1="180.34" y1="-35.56" x2="187.96" y2="-35.56" width="0.1524" layer="91"/>
<label x="182.88" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="10"/>
<wire x1="165.1" y1="-35.56" x2="157.48" y2="-35.56" width="0.1524" layer="91"/>
<label x="157.48" y="-35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="19"/>
<wire x1="180.34" y1="-15.24" x2="187.96" y2="-15.24" width="0.1524" layer="91"/>
<label x="182.88" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X37" gate="-2" pin="S"/>
<pinref part="X38" gate="-2" pin="S"/>
<wire x1="-25.4" y1="-66.04" x2="-5.08" y2="-66.04" width="0.1524" layer="91"/>
<pinref part="X39" gate="-2" pin="S"/>
<wire x1="-5.08" y1="-66.04" x2="12.7" y2="-66.04" width="0.1524" layer="91"/>
<junction x="-5.08" y="-66.04"/>
<pinref part="X40" gate="-2" pin="S"/>
<wire x1="12.7" y1="-66.04" x2="35.56" y2="-66.04" width="0.1524" layer="91"/>
<junction x="12.7" y="-66.04"/>
<label x="-33.02" y="-66.04" size="1.778" layer="95"/>
<wire x1="-25.4" y1="-66.04" x2="-53.34" y2="-66.04" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="-66.04" x2="-53.34" y2="-73.66" width="0.1524" layer="91"/>
<junction x="-25.4" y="-66.04"/>
<pinref part="X37" gate="-5" pin="S"/>
<pinref part="X38" gate="-5" pin="S"/>
<wire x1="-25.4" y1="-73.66" x2="-5.08" y2="-73.66" width="0.1524" layer="91"/>
<pinref part="X39" gate="-5" pin="S"/>
<wire x1="-5.08" y1="-73.66" x2="12.7" y2="-73.66" width="0.1524" layer="91"/>
<junction x="-5.08" y="-73.66"/>
<pinref part="X40" gate="-5" pin="S"/>
<wire x1="12.7" y1="-73.66" x2="35.56" y2="-73.66" width="0.1524" layer="91"/>
<junction x="12.7" y="-73.66"/>
<label x="-30.48" y="-73.66" size="1.778" layer="95"/>
<wire x1="-53.34" y1="-73.66" x2="-25.4" y2="-73.66" width="0.1524" layer="91"/>
<junction x="-25.4" y="-73.66"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="81.28" y1="-68.58" x2="81.28" y2="-73.66" width="0.1524" layer="91"/>
<label x="88.9" y="-73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="17"/>
<pinref part="X1" gate="-1" pin="S"/>
<wire x1="33.02" y1="78.74" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="16"/>
<pinref part="X1" gate="-2" pin="S"/>
<wire x1="33.02" y1="76.2" x2="17.78" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="15"/>
<pinref part="X1" gate="-3" pin="S"/>
<wire x1="33.02" y1="73.66" x2="17.78" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="14"/>
<pinref part="X1" gate="-4" pin="S"/>
<wire x1="33.02" y1="71.12" x2="17.78" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="4"/>
<pinref part="X2" gate="-1" pin="S"/>
<wire x1="-12.7" y1="78.74" x2="2.54" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="5"/>
<pinref part="X2" gate="-2" pin="S"/>
<wire x1="-12.7" y1="76.2" x2="2.54" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="6"/>
<pinref part="X2" gate="-3" pin="S"/>
<wire x1="-12.7" y1="73.66" x2="2.54" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="7"/>
<pinref part="X2" gate="-4" pin="S"/>
<wire x1="-12.7" y1="71.12" x2="2.54" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="2"/>
<wire x1="2.54" y1="83.82" x2="-5.08" y2="83.82" width="0.1524" layer="91"/>
<label x="-5.08" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="2"/>
<wire x1="78.74" y1="83.82" x2="71.12" y2="83.82" width="0.1524" layer="91"/>
<label x="71.12" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="2"/>
<wire x1="157.48" y1="83.82" x2="149.86" y2="83.82" width="0.1524" layer="91"/>
<label x="149.86" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="2"/>
<wire x1="2.54" y1="35.56" x2="-5.08" y2="35.56" width="0.1524" layer="91"/>
<label x="-5.08" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="2"/>
<wire x1="78.74" y1="35.56" x2="71.12" y2="35.56" width="0.1524" layer="91"/>
<label x="71.12" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="2"/>
<wire x1="160.02" y1="35.56" x2="152.4" y2="35.56" width="0.1524" layer="91"/>
<label x="152.4" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="2"/>
<wire x1="0" y1="-15.24" x2="-7.62" y2="-15.24" width="0.1524" layer="91"/>
<label x="-7.62" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="2"/>
<wire x1="81.28" y1="-15.24" x2="73.66" y2="-15.24" width="0.1524" layer="91"/>
<label x="73.66" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="2"/>
<wire x1="165.1" y1="-15.24" x2="157.48" y2="-15.24" width="0.1524" layer="91"/>
<label x="157.48" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="81.28" y1="-60.96" x2="81.28" y2="-55.88" width="0.1524" layer="91"/>
<label x="88.9" y="-58.42" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X37" gate="-4" pin="S"/>
<pinref part="X38" gate="-4" pin="S"/>
<wire x1="-25.4" y1="-71.12" x2="-5.08" y2="-71.12" width="0.1524" layer="91"/>
<pinref part="X39" gate="-4" pin="S"/>
<wire x1="-5.08" y1="-71.12" x2="12.7" y2="-71.12" width="0.1524" layer="91"/>
<junction x="-5.08" y="-71.12"/>
<pinref part="X40" gate="-4" pin="S"/>
<wire x1="12.7" y1="-71.12" x2="35.56" y2="-71.12" width="0.1524" layer="91"/>
<junction x="12.7" y="-71.12"/>
<label x="-35.56" y="-71.12" size="1.778" layer="95"/>
<wire x1="-25.4" y1="-71.12" x2="-50.8" y2="-71.12" width="0.1524" layer="91"/>
<junction x="-25.4" y="-71.12"/>
<pinref part="X37" gate="-1" pin="S"/>
<wire x1="-25.4" y1="-63.5" x2="-5.08" y2="-63.5" width="0.1524" layer="91"/>
<pinref part="X38" gate="-1" pin="S"/>
<pinref part="X39" gate="-1" pin="S"/>
<wire x1="-5.08" y1="-63.5" x2="12.7" y2="-63.5" width="0.1524" layer="91"/>
<junction x="-5.08" y="-63.5"/>
<pinref part="X40" gate="-1" pin="S"/>
<wire x1="12.7" y1="-63.5" x2="35.56" y2="-63.5" width="0.1524" layer="91"/>
<junction x="12.7" y="-63.5"/>
<label x="-33.02" y="-63.5" size="1.778" layer="95"/>
<wire x1="-50.8" y1="-71.12" x2="-50.8" y2="-63.5" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="-63.5" x2="-25.4" y2="-63.5" width="0.1524" layer="91"/>
<junction x="-25.4" y="-63.5"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="17"/>
<pinref part="X5" gate="-1" pin="S"/>
<wire x1="109.22" y1="78.74" x2="93.98" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="16"/>
<pinref part="X5" gate="-2" pin="S"/>
<wire x1="109.22" y1="76.2" x2="93.98" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="15"/>
<pinref part="X5" gate="-3" pin="S"/>
<wire x1="109.22" y1="73.66" x2="93.98" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="14"/>
<pinref part="X5" gate="-4" pin="S"/>
<wire x1="109.22" y1="71.12" x2="93.98" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="4"/>
<pinref part="X6" gate="-1" pin="S"/>
<wire x1="63.5" y1="78.74" x2="78.74" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="5"/>
<pinref part="X6" gate="-2" pin="S"/>
<wire x1="63.5" y1="76.2" x2="78.74" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="6"/>
<pinref part="X6" gate="-3" pin="S"/>
<wire x1="63.5" y1="73.66" x2="78.74" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="7"/>
<pinref part="X6" gate="-4" pin="S"/>
<wire x1="63.5" y1="71.12" x2="78.74" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="17"/>
<pinref part="X9" gate="-1" pin="S"/>
<wire x1="187.96" y1="78.74" x2="172.72" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="16"/>
<pinref part="X9" gate="-2" pin="S"/>
<wire x1="187.96" y1="76.2" x2="172.72" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="15"/>
<pinref part="X9" gate="-3" pin="S"/>
<wire x1="187.96" y1="73.66" x2="172.72" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="14"/>
<pinref part="X9" gate="-4" pin="S"/>
<wire x1="187.96" y1="71.12" x2="172.72" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="4"/>
<pinref part="X10" gate="-1" pin="S"/>
<wire x1="142.24" y1="78.74" x2="157.48" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="5"/>
<pinref part="X10" gate="-2" pin="S"/>
<wire x1="142.24" y1="76.2" x2="157.48" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="6"/>
<pinref part="X10" gate="-3" pin="S"/>
<wire x1="142.24" y1="73.66" x2="157.48" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="7"/>
<pinref part="X10" gate="-4" pin="S"/>
<wire x1="142.24" y1="71.12" x2="157.48" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="17"/>
<pinref part="X13" gate="-1" pin="S"/>
<wire x1="33.02" y1="30.48" x2="17.78" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="16"/>
<pinref part="X13" gate="-2" pin="S"/>
<wire x1="33.02" y1="27.94" x2="17.78" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="15"/>
<pinref part="X13" gate="-3" pin="S"/>
<wire x1="33.02" y1="25.4" x2="17.78" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="14"/>
<pinref part="X13" gate="-4" pin="S"/>
<wire x1="33.02" y1="22.86" x2="17.78" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="4"/>
<pinref part="X14" gate="-1" pin="S"/>
<wire x1="-12.7" y1="30.48" x2="2.54" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="5"/>
<pinref part="X14" gate="-2" pin="S"/>
<wire x1="-12.7" y1="27.94" x2="2.54" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$45" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="6"/>
<pinref part="X14" gate="-3" pin="S"/>
<wire x1="-12.7" y1="25.4" x2="2.54" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$46" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="7"/>
<pinref part="X14" gate="-4" pin="S"/>
<wire x1="-12.7" y1="22.86" x2="2.54" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="17"/>
<pinref part="X17" gate="-1" pin="S"/>
<wire x1="109.22" y1="30.48" x2="93.98" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$50" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="16"/>
<pinref part="X17" gate="-2" pin="S"/>
<wire x1="109.22" y1="27.94" x2="93.98" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$51" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="15"/>
<pinref part="X17" gate="-3" pin="S"/>
<wire x1="109.22" y1="25.4" x2="93.98" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$52" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="14"/>
<pinref part="X17" gate="-4" pin="S"/>
<wire x1="109.22" y1="22.86" x2="93.98" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$55" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="4"/>
<pinref part="X18" gate="-1" pin="S"/>
<wire x1="63.5" y1="30.48" x2="78.74" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$56" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="5"/>
<pinref part="X18" gate="-2" pin="S"/>
<wire x1="63.5" y1="27.94" x2="78.74" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$57" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="6"/>
<pinref part="X18" gate="-3" pin="S"/>
<wire x1="63.5" y1="25.4" x2="78.74" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$58" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="7"/>
<pinref part="X18" gate="-4" pin="S"/>
<wire x1="63.5" y1="22.86" x2="78.74" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$61" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="17"/>
<pinref part="X21" gate="-1" pin="S"/>
<wire x1="190.5" y1="30.48" x2="175.26" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$62" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="16"/>
<pinref part="X21" gate="-2" pin="S"/>
<wire x1="190.5" y1="27.94" x2="175.26" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$63" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="15"/>
<pinref part="X21" gate="-3" pin="S"/>
<wire x1="190.5" y1="25.4" x2="175.26" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$64" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="14"/>
<pinref part="X21" gate="-4" pin="S"/>
<wire x1="190.5" y1="22.86" x2="175.26" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$67" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="4"/>
<pinref part="X22" gate="-1" pin="S"/>
<wire x1="144.78" y1="30.48" x2="160.02" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$68" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="5"/>
<pinref part="X22" gate="-2" pin="S"/>
<wire x1="144.78" y1="27.94" x2="160.02" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$69" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="6"/>
<pinref part="X22" gate="-3" pin="S"/>
<wire x1="144.78" y1="25.4" x2="160.02" y2="25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$70" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="7"/>
<pinref part="X22" gate="-4" pin="S"/>
<wire x1="144.78" y1="22.86" x2="160.02" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$73" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="17"/>
<pinref part="X25" gate="-1" pin="S"/>
<wire x1="30.48" y1="-20.32" x2="15.24" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$74" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="16"/>
<pinref part="X25" gate="-2" pin="S"/>
<wire x1="30.48" y1="-22.86" x2="15.24" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$75" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="15"/>
<pinref part="X25" gate="-3" pin="S"/>
<wire x1="30.48" y1="-25.4" x2="15.24" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$76" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="14"/>
<pinref part="X25" gate="-4" pin="S"/>
<wire x1="30.48" y1="-27.94" x2="15.24" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$79" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="4"/>
<pinref part="X26" gate="-1" pin="S"/>
<wire x1="-15.24" y1="-20.32" x2="0" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$80" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="5"/>
<pinref part="X26" gate="-2" pin="S"/>
<wire x1="-15.24" y1="-22.86" x2="0" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$81" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="6"/>
<pinref part="X26" gate="-3" pin="S"/>
<wire x1="-15.24" y1="-25.4" x2="0" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$82" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="7"/>
<pinref part="X26" gate="-4" pin="S"/>
<wire x1="-15.24" y1="-27.94" x2="0" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$85" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="17"/>
<pinref part="X29" gate="-1" pin="S"/>
<wire x1="111.76" y1="-20.32" x2="96.52" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$86" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="16"/>
<pinref part="X29" gate="-2" pin="S"/>
<wire x1="111.76" y1="-22.86" x2="96.52" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$87" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="15"/>
<pinref part="X29" gate="-3" pin="S"/>
<wire x1="111.76" y1="-25.4" x2="96.52" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$88" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="14"/>
<pinref part="X29" gate="-4" pin="S"/>
<wire x1="111.76" y1="-27.94" x2="96.52" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$91" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="4"/>
<pinref part="X30" gate="-1" pin="S"/>
<wire x1="66.04" y1="-20.32" x2="81.28" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$92" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="5"/>
<pinref part="X30" gate="-2" pin="S"/>
<wire x1="66.04" y1="-22.86" x2="81.28" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$93" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="6"/>
<pinref part="X30" gate="-3" pin="S"/>
<wire x1="66.04" y1="-25.4" x2="81.28" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$94" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="7"/>
<pinref part="X30" gate="-4" pin="S"/>
<wire x1="66.04" y1="-27.94" x2="81.28" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$97" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="17"/>
<pinref part="X33" gate="-1" pin="S"/>
<wire x1="195.58" y1="-20.32" x2="180.34" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$98" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="16"/>
<pinref part="X33" gate="-2" pin="S"/>
<wire x1="195.58" y1="-22.86" x2="180.34" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$99" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="15"/>
<pinref part="X33" gate="-3" pin="S"/>
<wire x1="195.58" y1="-25.4" x2="180.34" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$100" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="14"/>
<pinref part="X33" gate="-4" pin="S"/>
<wire x1="195.58" y1="-27.94" x2="180.34" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$103" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="4"/>
<pinref part="X34" gate="-1" pin="S"/>
<wire x1="149.86" y1="-20.32" x2="165.1" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$104" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="5"/>
<pinref part="X34" gate="-2" pin="S"/>
<wire x1="149.86" y1="-22.86" x2="165.1" y2="-22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$105" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="6"/>
<pinref part="X34" gate="-3" pin="S"/>
<wire x1="149.86" y1="-25.4" x2="165.1" y2="-25.4" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$106" class="0">
<segment>
<pinref part="IC9" gate="G$1" pin="7"/>
<pinref part="X34" gate="-4" pin="S"/>
<wire x1="149.86" y1="-27.94" x2="165.1" y2="-27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$109" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="18"/>
<pinref part="IC2" gate="G$1" pin="3"/>
<wire x1="17.78" y1="81.28" x2="78.74" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$110" class="0">
<segment>
<pinref part="IC2" gate="G$1" pin="18"/>
<pinref part="IC3" gate="G$1" pin="3"/>
<wire x1="93.98" y1="81.28" x2="157.48" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$111" class="0">
<segment>
<pinref part="IC3" gate="G$1" pin="18"/>
<wire x1="172.72" y1="81.28" x2="210.82" y2="81.28" width="0.1524" layer="91"/>
<wire x1="210.82" y1="81.28" x2="210.82" y2="50.8" width="0.1524" layer="91"/>
<wire x1="210.82" y1="50.8" x2="-10.16" y2="50.8" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="3"/>
<wire x1="-10.16" y1="50.8" x2="-10.16" y2="33.02" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="33.02" x2="2.54" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$112" class="0">
<segment>
<pinref part="IC4" gate="G$1" pin="18"/>
<pinref part="IC5" gate="G$1" pin="3"/>
<wire x1="17.78" y1="33.02" x2="78.74" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$113" class="0">
<segment>
<pinref part="IC5" gate="G$1" pin="18"/>
<pinref part="IC6" gate="G$1" pin="3"/>
<wire x1="93.98" y1="33.02" x2="160.02" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$114" class="0">
<segment>
<pinref part="IC6" gate="G$1" pin="18"/>
<wire x1="175.26" y1="33.02" x2="210.82" y2="33.02" width="0.1524" layer="91"/>
<wire x1="210.82" y1="33.02" x2="210.82" y2="2.54" width="0.1524" layer="91"/>
<wire x1="210.82" y1="2.54" x2="-12.7" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="2.54" x2="-12.7" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="IC7" gate="G$1" pin="3"/>
<wire x1="-12.7" y1="-17.78" x2="0" y2="-17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$115" class="0">
<segment>
<pinref part="IC7" gate="G$1" pin="18"/>
<pinref part="IC8" gate="G$1" pin="3"/>
<wire x1="15.24" y1="-17.78" x2="81.28" y2="-17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$116" class="0">
<segment>
<pinref part="IC8" gate="G$1" pin="18"/>
<pinref part="IC9" gate="G$1" pin="3"/>
<wire x1="96.52" y1="-17.78" x2="165.1" y2="-17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="DATAIN" class="0">
<segment>
<pinref part="X37" gate="-3" pin="S"/>
<pinref part="X38" gate="-3" pin="S"/>
<wire x1="-25.4" y1="-68.58" x2="-5.08" y2="-68.58" width="0.1524" layer="91"/>
<pinref part="X39" gate="-3" pin="S"/>
<wire x1="-5.08" y1="-68.58" x2="12.7" y2="-68.58" width="0.1524" layer="91"/>
<junction x="-5.08" y="-68.58"/>
<pinref part="X40" gate="-3" pin="S"/>
<wire x1="12.7" y1="-68.58" x2="35.56" y2="-68.58" width="0.1524" layer="91"/>
<junction x="12.7" y="-68.58"/>
<label x="-35.56" y="-68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="3"/>
<wire x1="2.54" y1="81.28" x2="-5.08" y2="81.28" width="0.1524" layer="91"/>
<label x="-10.16" y="81.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="SRCLR" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="8"/>
<pinref part="X2" gate="-5" pin="S"/>
<wire x1="-12.7" y1="68.58" x2="-10.16" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X4" gate="-1" pin="S"/>
<wire x1="-10.16" y1="68.58" x2="2.54" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="60.96" x2="-10.16" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="60.96" x2="-10.16" y2="68.58" width="0.1524" layer="91"/>
<junction x="-10.16" y="68.58"/>
<label x="-7.62" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="8"/>
<pinref part="X6" gate="-5" pin="S"/>
<wire x1="63.5" y1="68.58" x2="66.04" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X8" gate="-1" pin="S"/>
<wire x1="66.04" y1="68.58" x2="78.74" y2="68.58" width="0.1524" layer="91"/>
<wire x1="63.5" y1="60.96" x2="66.04" y2="60.96" width="0.1524" layer="91"/>
<wire x1="66.04" y1="60.96" x2="66.04" y2="68.58" width="0.1524" layer="91"/>
<junction x="66.04" y="68.58"/>
<label x="66.04" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="8"/>
<pinref part="X10" gate="-5" pin="S"/>
<wire x1="142.24" y1="68.58" x2="144.78" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X12" gate="-1" pin="S"/>
<wire x1="144.78" y1="68.58" x2="157.48" y2="68.58" width="0.1524" layer="91"/>
<wire x1="142.24" y1="60.96" x2="144.78" y2="60.96" width="0.1524" layer="91"/>
<wire x1="144.78" y1="60.96" x2="144.78" y2="68.58" width="0.1524" layer="91"/>
<junction x="144.78" y="68.58"/>
<label x="144.78" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="8"/>
<pinref part="X14" gate="-5" pin="S"/>
<wire x1="-12.7" y1="20.32" x2="-10.16" y2="20.32" width="0.1524" layer="91"/>
<pinref part="X16" gate="-1" pin="S"/>
<wire x1="-10.16" y1="20.32" x2="2.54" y2="20.32" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="12.7" x2="-10.16" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="12.7" x2="-10.16" y2="20.32" width="0.1524" layer="91"/>
<junction x="-10.16" y="20.32"/>
<label x="-10.16" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="8"/>
<pinref part="X18" gate="-5" pin="S"/>
<wire x1="63.5" y1="20.32" x2="66.04" y2="20.32" width="0.1524" layer="91"/>
<pinref part="X20" gate="-1" pin="S"/>
<wire x1="66.04" y1="20.32" x2="78.74" y2="20.32" width="0.1524" layer="91"/>
<wire x1="63.5" y1="12.7" x2="66.04" y2="12.7" width="0.1524" layer="91"/>
<wire x1="66.04" y1="12.7" x2="66.04" y2="20.32" width="0.1524" layer="91"/>
<junction x="66.04" y="20.32"/>
<label x="71.12" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="8"/>
<pinref part="X22" gate="-5" pin="S"/>
<wire x1="144.78" y1="20.32" x2="147.32" y2="20.32" width="0.1524" layer="91"/>
<pinref part="X24" gate="-1" pin="S"/>
<wire x1="147.32" y1="20.32" x2="160.02" y2="20.32" width="0.1524" layer="91"/>
<wire x1="144.78" y1="12.7" x2="147.32" y2="12.7" width="0.1524" layer="91"/>
<wire x1="147.32" y1="12.7" x2="147.32" y2="20.32" width="0.1524" layer="91"/>
<junction x="147.32" y="20.32"/>
<label x="149.86" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="8"/>
<pinref part="X26" gate="-5" pin="S"/>
<wire x1="-15.24" y1="-30.48" x2="-12.7" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="X28" gate="-1" pin="S"/>
<wire x1="-12.7" y1="-30.48" x2="0" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="-38.1" x2="-12.7" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="-38.1" x2="-12.7" y2="-30.48" width="0.1524" layer="91"/>
<junction x="-12.7" y="-30.48"/>
<label x="-12.7" y="-30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="8"/>
<pinref part="X30" gate="-5" pin="S"/>
<wire x1="66.04" y1="-30.48" x2="68.58" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="X32" gate="-1" pin="S"/>
<wire x1="68.58" y1="-30.48" x2="81.28" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-38.1" x2="68.58" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="68.58" y1="-38.1" x2="68.58" y2="-30.48" width="0.1524" layer="91"/>
<junction x="68.58" y="-30.48"/>
<label x="71.12" y="-30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="8"/>
<pinref part="X34" gate="-5" pin="S"/>
<wire x1="149.86" y1="-30.48" x2="152.4" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="X36" gate="-1" pin="S"/>
<wire x1="152.4" y1="-30.48" x2="165.1" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-38.1" x2="152.4" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="152.4" y1="-38.1" x2="152.4" y2="-30.48" width="0.1524" layer="91"/>
<junction x="152.4" y="-30.48"/>
<label x="152.4" y="-30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="G" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="9"/>
<pinref part="X2" gate="-6" pin="S"/>
<wire x1="-12.7" y1="66.04" x2="-7.62" y2="66.04" width="0.1524" layer="91"/>
<pinref part="X4" gate="-2" pin="S"/>
<wire x1="-7.62" y1="66.04" x2="2.54" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="58.42" x2="-7.62" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="58.42" x2="-7.62" y2="66.04" width="0.1524" layer="91"/>
<junction x="-7.62" y="66.04"/>
<label x="-5.08" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="9"/>
<pinref part="X6" gate="-6" pin="S"/>
<wire x1="63.5" y1="66.04" x2="68.58" y2="66.04" width="0.1524" layer="91"/>
<pinref part="X8" gate="-2" pin="S"/>
<wire x1="68.58" y1="66.04" x2="78.74" y2="66.04" width="0.1524" layer="91"/>
<wire x1="63.5" y1="58.42" x2="68.58" y2="58.42" width="0.1524" layer="91"/>
<wire x1="68.58" y1="58.42" x2="68.58" y2="66.04" width="0.1524" layer="91"/>
<junction x="68.58" y="66.04"/>
<label x="68.58" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="9"/>
<pinref part="X10" gate="-6" pin="S"/>
<wire x1="142.24" y1="66.04" x2="147.32" y2="66.04" width="0.1524" layer="91"/>
<pinref part="X12" gate="-2" pin="S"/>
<wire x1="147.32" y1="66.04" x2="157.48" y2="66.04" width="0.1524" layer="91"/>
<wire x1="142.24" y1="58.42" x2="147.32" y2="58.42" width="0.1524" layer="91"/>
<wire x1="147.32" y1="58.42" x2="147.32" y2="66.04" width="0.1524" layer="91"/>
<junction x="147.32" y="66.04"/>
<label x="147.32" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="9"/>
<pinref part="X14" gate="-6" pin="S"/>
<wire x1="-12.7" y1="17.78" x2="-7.62" y2="17.78" width="0.1524" layer="91"/>
<pinref part="X16" gate="-2" pin="S"/>
<wire x1="-7.62" y1="17.78" x2="2.54" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="10.16" x2="-7.62" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="17.78" width="0.1524" layer="91"/>
<junction x="-7.62" y="17.78"/>
<label x="-5.08" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="9"/>
<pinref part="X18" gate="-6" pin="S"/>
<wire x1="63.5" y1="17.78" x2="68.58" y2="17.78" width="0.1524" layer="91"/>
<pinref part="X20" gate="-2" pin="S"/>
<wire x1="68.58" y1="17.78" x2="78.74" y2="17.78" width="0.1524" layer="91"/>
<wire x1="63.5" y1="10.16" x2="68.58" y2="10.16" width="0.1524" layer="91"/>
<wire x1="68.58" y1="10.16" x2="68.58" y2="17.78" width="0.1524" layer="91"/>
<junction x="68.58" y="17.78"/>
<label x="68.58" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="9"/>
<pinref part="X22" gate="-6" pin="S"/>
<wire x1="144.78" y1="17.78" x2="149.86" y2="17.78" width="0.1524" layer="91"/>
<pinref part="X24" gate="-2" pin="S"/>
<wire x1="149.86" y1="17.78" x2="160.02" y2="17.78" width="0.1524" layer="91"/>
<wire x1="144.78" y1="10.16" x2="149.86" y2="10.16" width="0.1524" layer="91"/>
<wire x1="149.86" y1="10.16" x2="149.86" y2="17.78" width="0.1524" layer="91"/>
<junction x="149.86" y="17.78"/>
<label x="149.86" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="9"/>
<pinref part="X26" gate="-6" pin="S"/>
<wire x1="-15.24" y1="-33.02" x2="-10.16" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="X28" gate="-2" pin="S"/>
<wire x1="-10.16" y1="-33.02" x2="0" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="-40.64" x2="-10.16" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="-40.64" x2="-10.16" y2="-33.02" width="0.1524" layer="91"/>
<junction x="-10.16" y="-33.02"/>
<label x="-10.16" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="9"/>
<pinref part="X30" gate="-6" pin="S"/>
<wire x1="66.04" y1="-33.02" x2="71.12" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="X32" gate="-2" pin="S"/>
<wire x1="71.12" y1="-33.02" x2="81.28" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="66.04" y1="-40.64" x2="71.12" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-40.64" x2="71.12" y2="-33.02" width="0.1524" layer="91"/>
<junction x="71.12" y="-33.02"/>
<label x="73.66" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="9"/>
<pinref part="X34" gate="-6" pin="S"/>
<wire x1="149.86" y1="-33.02" x2="154.94" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="X36" gate="-2" pin="S"/>
<wire x1="154.94" y1="-33.02" x2="165.1" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="149.86" y1="-40.64" x2="154.94" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="154.94" y1="-40.64" x2="154.94" y2="-33.02" width="0.1524" layer="91"/>
<junction x="154.94" y="-33.02"/>
<label x="154.94" y="-33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="X37" gate="-6" pin="S"/>
<pinref part="X38" gate="-6" pin="S"/>
<wire x1="-25.4" y1="-76.2" x2="-5.08" y2="-76.2" width="0.1524" layer="91"/>
<pinref part="X39" gate="-6" pin="S"/>
<wire x1="-5.08" y1="-76.2" x2="12.7" y2="-76.2" width="0.1524" layer="91"/>
<junction x="-5.08" y="-76.2"/>
<pinref part="X40" gate="-6" pin="S"/>
<wire x1="12.7" y1="-76.2" x2="35.56" y2="-76.2" width="0.1524" layer="91"/>
<junction x="12.7" y="-76.2"/>
<label x="-33.02" y="-76.2" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="13"/>
<pinref part="X1" gate="-5" pin="S"/>
<wire x1="33.02" y1="68.58" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X3" gate="-1" pin="S"/>
<wire x1="30.48" y1="68.58" x2="17.78" y2="68.58" width="0.1524" layer="91"/>
<wire x1="33.02" y1="60.96" x2="30.48" y2="60.96" width="0.1524" layer="91"/>
<wire x1="30.48" y1="60.96" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
<junction x="30.48" y="68.58"/>
<label x="20.32" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="G$1" pin="13"/>
<pinref part="X5" gate="-5" pin="S"/>
<wire x1="109.22" y1="68.58" x2="106.68" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X7" gate="-1" pin="S"/>
<wire x1="106.68" y1="68.58" x2="93.98" y2="68.58" width="0.1524" layer="91"/>
<wire x1="109.22" y1="60.96" x2="106.68" y2="60.96" width="0.1524" layer="91"/>
<wire x1="106.68" y1="60.96" x2="106.68" y2="68.58" width="0.1524" layer="91"/>
<junction x="106.68" y="68.58"/>
<label x="104.14" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC3" gate="G$1" pin="13"/>
<pinref part="X9" gate="-5" pin="S"/>
<wire x1="187.96" y1="68.58" x2="185.42" y2="68.58" width="0.1524" layer="91"/>
<pinref part="X11" gate="-1" pin="S"/>
<wire x1="185.42" y1="68.58" x2="172.72" y2="68.58" width="0.1524" layer="91"/>
<wire x1="187.96" y1="60.96" x2="185.42" y2="60.96" width="0.1524" layer="91"/>
<wire x1="185.42" y1="60.96" x2="185.42" y2="68.58" width="0.1524" layer="91"/>
<junction x="185.42" y="68.58"/>
<label x="180.34" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC4" gate="G$1" pin="13"/>
<pinref part="X13" gate="-5" pin="S"/>
<wire x1="33.02" y1="20.32" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
<pinref part="X15" gate="-1" pin="S"/>
<wire x1="30.48" y1="20.32" x2="17.78" y2="20.32" width="0.1524" layer="91"/>
<wire x1="33.02" y1="12.7" x2="30.48" y2="12.7" width="0.1524" layer="91"/>
<wire x1="30.48" y1="12.7" x2="30.48" y2="20.32" width="0.1524" layer="91"/>
<junction x="30.48" y="20.32"/>
<label x="30.48" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC5" gate="G$1" pin="13"/>
<pinref part="X17" gate="-5" pin="S"/>
<wire x1="109.22" y1="20.32" x2="106.68" y2="20.32" width="0.1524" layer="91"/>
<pinref part="X19" gate="-1" pin="S"/>
<wire x1="106.68" y1="20.32" x2="93.98" y2="20.32" width="0.1524" layer="91"/>
<wire x1="109.22" y1="12.7" x2="106.68" y2="12.7" width="0.1524" layer="91"/>
<wire x1="106.68" y1="12.7" x2="106.68" y2="20.32" width="0.1524" layer="91"/>
<junction x="106.68" y="20.32"/>
<label x="106.68" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC6" gate="G$1" pin="13"/>
<pinref part="X21" gate="-5" pin="S"/>
<wire x1="190.5" y1="20.32" x2="187.96" y2="20.32" width="0.1524" layer="91"/>
<pinref part="X23" gate="-1" pin="S"/>
<wire x1="187.96" y1="20.32" x2="175.26" y2="20.32" width="0.1524" layer="91"/>
<wire x1="190.5" y1="12.7" x2="187.96" y2="12.7" width="0.1524" layer="91"/>
<wire x1="187.96" y1="12.7" x2="187.96" y2="20.32" width="0.1524" layer="91"/>
<junction x="187.96" y="20.32"/>
<label x="187.96" y="20.32" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC7" gate="G$1" pin="13"/>
<pinref part="X25" gate="-5" pin="S"/>
<wire x1="30.48" y1="-30.48" x2="27.94" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="X27" gate="-1" pin="S"/>
<wire x1="27.94" y1="-30.48" x2="15.24" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="30.48" y1="-38.1" x2="27.94" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-38.1" x2="27.94" y2="-30.48" width="0.1524" layer="91"/>
<junction x="27.94" y="-30.48"/>
<label x="27.94" y="-30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC8" gate="G$1" pin="13"/>
<pinref part="X29" gate="-5" pin="S"/>
<wire x1="111.76" y1="-30.48" x2="109.22" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="X31" gate="-1" pin="S"/>
<wire x1="109.22" y1="-30.48" x2="96.52" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="111.76" y1="-38.1" x2="109.22" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="109.22" y1="-38.1" x2="109.22" y2="-30.48" width="0.1524" layer="91"/>
<junction x="109.22" y="-30.48"/>
<label x="109.22" y="-30.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="13"/>
<pinref part="X33" gate="-5" pin="S"/>
<wire x1="195.58" y1="-30.48" x2="193.04" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="X35" gate="-1" pin="S"/>
<wire x1="193.04" y1="-30.48" x2="180.34" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="195.58" y1="-38.1" x2="193.04" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="193.04" y1="-38.1" x2="193.04" y2="-30.48" width="0.1524" layer="91"/>
<junction x="193.04" y="-30.48"/>
<label x="193.04" y="-30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="LATCH" class="0">
<segment>
<pinref part="X37" gate="-7" pin="S"/>
<pinref part="X38" gate="-7" pin="S"/>
<wire x1="-25.4" y1="-78.74" x2="-5.08" y2="-78.74" width="0.1524" layer="91"/>
<pinref part="X39" gate="-7" pin="S"/>
<wire x1="-5.08" y1="-78.74" x2="12.7" y2="-78.74" width="0.1524" layer="91"/>
<junction x="-5.08" y="-78.74"/>
<pinref part="X40" gate="-7" pin="S"/>
<wire x1="12.7" y1="-78.74" x2="35.56" y2="-78.74" width="0.1524" layer="91"/>
<junction x="12.7" y="-78.74"/>
<label x="-35.56" y="-78.74" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X3" gate="-2" pin="S"/>
<wire x1="33.02" y1="58.42" x2="27.94" y2="58.42" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="12"/>
<pinref part="X1" gate="-6" pin="S"/>
<wire x1="33.02" y1="66.04" x2="27.94" y2="66.04" width="0.1524" layer="91"/>
<wire x1="27.94" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<wire x1="27.94" y1="58.42" x2="27.94" y2="66.04" width="0.1524" layer="91"/>
<junction x="27.94" y="66.04"/>
<label x="20.32" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X7" gate="-2" pin="S"/>
<wire x1="109.22" y1="58.42" x2="104.14" y2="58.42" width="0.1524" layer="91"/>
<pinref part="IC2" gate="G$1" pin="12"/>
<pinref part="X5" gate="-6" pin="S"/>
<wire x1="109.22" y1="66.04" x2="104.14" y2="66.04" width="0.1524" layer="91"/>
<wire x1="104.14" y1="66.04" x2="93.98" y2="66.04" width="0.1524" layer="91"/>
<wire x1="104.14" y1="58.42" x2="104.14" y2="66.04" width="0.1524" layer="91"/>
<junction x="104.14" y="66.04"/>
<label x="101.6" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X11" gate="-2" pin="S"/>
<wire x1="187.96" y1="58.42" x2="182.88" y2="58.42" width="0.1524" layer="91"/>
<pinref part="IC3" gate="G$1" pin="12"/>
<pinref part="X9" gate="-6" pin="S"/>
<wire x1="187.96" y1="66.04" x2="182.88" y2="66.04" width="0.1524" layer="91"/>
<wire x1="182.88" y1="66.04" x2="172.72" y2="66.04" width="0.1524" layer="91"/>
<wire x1="182.88" y1="58.42" x2="182.88" y2="66.04" width="0.1524" layer="91"/>
<junction x="182.88" y="66.04"/>
<label x="167.64" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X15" gate="-2" pin="S"/>
<wire x1="33.02" y1="10.16" x2="27.94" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC4" gate="G$1" pin="12"/>
<pinref part="X13" gate="-6" pin="S"/>
<wire x1="33.02" y1="17.78" x2="27.94" y2="17.78" width="0.1524" layer="91"/>
<wire x1="27.94" y1="17.78" x2="17.78" y2="17.78" width="0.1524" layer="91"/>
<wire x1="27.94" y1="10.16" x2="27.94" y2="17.78" width="0.1524" layer="91"/>
<junction x="27.94" y="17.78"/>
<label x="27.94" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X19" gate="-2" pin="S"/>
<wire x1="109.22" y1="10.16" x2="104.14" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC5" gate="G$1" pin="12"/>
<pinref part="X17" gate="-6" pin="S"/>
<wire x1="109.22" y1="17.78" x2="104.14" y2="17.78" width="0.1524" layer="91"/>
<wire x1="104.14" y1="17.78" x2="93.98" y2="17.78" width="0.1524" layer="91"/>
<wire x1="104.14" y1="10.16" x2="104.14" y2="17.78" width="0.1524" layer="91"/>
<junction x="104.14" y="17.78"/>
<label x="104.14" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X23" gate="-2" pin="S"/>
<wire x1="190.5" y1="10.16" x2="185.42" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC6" gate="G$1" pin="12"/>
<pinref part="X21" gate="-6" pin="S"/>
<wire x1="190.5" y1="17.78" x2="185.42" y2="17.78" width="0.1524" layer="91"/>
<wire x1="185.42" y1="17.78" x2="175.26" y2="17.78" width="0.1524" layer="91"/>
<wire x1="185.42" y1="10.16" x2="185.42" y2="17.78" width="0.1524" layer="91"/>
<junction x="185.42" y="17.78"/>
<label x="185.42" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X27" gate="-2" pin="S"/>
<wire x1="30.48" y1="-40.64" x2="25.4" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="IC7" gate="G$1" pin="12"/>
<pinref part="X25" gate="-6" pin="S"/>
<wire x1="30.48" y1="-33.02" x2="25.4" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-33.02" x2="15.24" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-40.64" x2="25.4" y2="-33.02" width="0.1524" layer="91"/>
<junction x="25.4" y="-33.02"/>
<label x="25.4" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X31" gate="-2" pin="S"/>
<wire x1="111.76" y1="-40.64" x2="106.68" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="IC8" gate="G$1" pin="12"/>
<pinref part="X29" gate="-6" pin="S"/>
<wire x1="111.76" y1="-33.02" x2="106.68" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="106.68" y1="-33.02" x2="96.52" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="106.68" y1="-40.64" x2="106.68" y2="-33.02" width="0.1524" layer="91"/>
<junction x="106.68" y="-33.02"/>
<label x="106.68" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="X35" gate="-2" pin="S"/>
<wire x1="195.58" y1="-40.64" x2="190.5" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="IC9" gate="G$1" pin="12"/>
<pinref part="X33" gate="-6" pin="S"/>
<wire x1="195.58" y1="-33.02" x2="190.5" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-33.02" x2="180.34" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="190.5" y1="-40.64" x2="190.5" y2="-33.02" width="0.1524" layer="91"/>
<junction x="190.5" y="-33.02"/>
<label x="190.5" y="-33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="DATAOUT" class="0">
<segment>
<pinref part="X37" gate="-8" pin="S"/>
<pinref part="X38" gate="-8" pin="S"/>
<wire x1="-25.4" y1="-81.28" x2="-5.08" y2="-81.28" width="0.1524" layer="91"/>
<pinref part="X39" gate="-8" pin="S"/>
<wire x1="-5.08" y1="-81.28" x2="12.7" y2="-81.28" width="0.1524" layer="91"/>
<junction x="-5.08" y="-81.28"/>
<pinref part="X40" gate="-8" pin="S"/>
<wire x1="12.7" y1="-81.28" x2="35.56" y2="-81.28" width="0.1524" layer="91"/>
<junction x="12.7" y="-81.28"/>
<label x="-38.1" y="-81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC9" gate="G$1" pin="18"/>
<wire x1="180.34" y1="-17.78" x2="187.96" y2="-17.78" width="0.1524" layer="91"/>
<label x="182.88" y="-17.78" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
