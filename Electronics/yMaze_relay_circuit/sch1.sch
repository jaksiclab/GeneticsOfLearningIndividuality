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
<library name="con-panduit" urn="urn:adsk.eagle:library:169">
<description>&lt;b&gt;Panduit Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="057-040-0" urn="urn:adsk.eagle:footprint:9166/1" library_version="2">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
angled</description>
<wire x1="-1.9" y1="-0.23" x2="-1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-0.23" x2="1.9" y2="-0.23" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-0.23" x2="1.9" y2="5.86" width="0.2032" layer="21"/>
<wire x1="-24.85" y1="5.22" x2="-24.15" y2="3.25" width="0.4064" layer="21"/>
<wire x1="-24.15" y1="3.25" x2="-23.45" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-23.45" y1="5.22" x2="-24.85" y2="5.22" width="0.4064" layer="21"/>
<wire x1="-29.26" y1="-2.54" x2="-29.26" y2="5.86" width="0.2032" layer="21"/>
<wire x1="29.26" y1="5.86" x2="29.26" y2="-2.44" width="0.2032" layer="21"/>
<wire x1="-29.21" y1="-2.54" x2="-26.67" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="-26.67" y1="-2.54" x2="-26.67" y2="-5.98" width="0.2032" layer="21"/>
<wire x1="29.21" y1="-2.54" x2="26.67" y2="-2.54" width="0.2032" layer="21"/>
<wire x1="26.67" y1="-2.54" x2="26.67" y2="-6.05" width="0.2032" layer="21"/>
<wire x1="26.66" y1="-6.04" x2="-26.66" y2="-6.04" width="0.2032" layer="21"/>
<wire x1="-29.26" y1="5.86" x2="29.26" y2="5.86" width="0.2032" layer="21"/>
<pad name="1" x="-24.13" y="-5.08" drill="1" shape="octagon"/>
<pad name="2" x="-24.13" y="-2.54" drill="1" shape="octagon"/>
<pad name="3" x="-21.59" y="-5.08" drill="1" shape="octagon"/>
<pad name="4" x="-21.59" y="-2.54" drill="1" shape="octagon"/>
<pad name="5" x="-19.05" y="-5.08" drill="1" shape="octagon"/>
<pad name="6" x="-19.05" y="-2.54" drill="1" shape="octagon"/>
<pad name="7" x="-16.51" y="-5.08" drill="1" shape="octagon"/>
<pad name="8" x="-16.51" y="-2.54" drill="1" shape="octagon"/>
<pad name="9" x="-13.97" y="-5.08" drill="1" shape="octagon"/>
<pad name="10" x="-13.97" y="-2.54" drill="1" shape="octagon"/>
<pad name="11" x="-11.43" y="-5.08" drill="1" shape="octagon"/>
<pad name="12" x="-11.43" y="-2.54" drill="1" shape="octagon"/>
<pad name="13" x="-8.89" y="-5.08" drill="1" shape="octagon"/>
<pad name="14" x="-8.89" y="-2.54" drill="1" shape="octagon"/>
<pad name="15" x="-6.35" y="-5.08" drill="1" shape="octagon"/>
<pad name="16" x="-6.35" y="-2.54" drill="1" shape="octagon"/>
<pad name="17" x="-3.81" y="-5.08" drill="1" shape="octagon"/>
<pad name="18" x="-3.81" y="-2.54" drill="1" shape="octagon"/>
<pad name="19" x="-1.27" y="-5.08" drill="1" shape="octagon"/>
<pad name="20" x="-1.27" y="-2.54" drill="1" shape="octagon"/>
<pad name="21" x="1.27" y="-5.08" drill="1" shape="octagon"/>
<pad name="22" x="1.27" y="-2.54" drill="1" shape="octagon"/>
<pad name="23" x="3.81" y="-5.08" drill="1" shape="octagon"/>
<pad name="24" x="3.81" y="-2.54" drill="1" shape="octagon"/>
<pad name="25" x="6.35" y="-5.08" drill="1" shape="octagon"/>
<pad name="26" x="6.35" y="-2.54" drill="1" shape="octagon"/>
<pad name="27" x="8.89" y="-5.08" drill="1" shape="octagon"/>
<pad name="28" x="8.89" y="-2.54" drill="1" shape="octagon"/>
<pad name="29" x="11.43" y="-5.08" drill="1" shape="octagon"/>
<pad name="30" x="11.43" y="-2.54" drill="1" shape="octagon"/>
<pad name="31" x="13.97" y="-5.08" drill="1" shape="octagon"/>
<pad name="32" x="13.97" y="-2.54" drill="1" shape="octagon"/>
<pad name="33" x="16.51" y="-5.08" drill="1" shape="octagon"/>
<pad name="34" x="16.51" y="-2.54" drill="1" shape="octagon"/>
<pad name="35" x="19.05" y="-5.08" drill="1" shape="octagon"/>
<pad name="36" x="19.05" y="-2.54" drill="1" shape="octagon"/>
<pad name="37" x="21.59" y="-5.08" drill="1" shape="octagon"/>
<pad name="38" x="21.59" y="-2.54" drill="1" shape="octagon"/>
<pad name="39" x="24.13" y="-5.08" drill="1" shape="octagon"/>
<pad name="40" x="24.13" y="-2.54" drill="1" shape="octagon"/>
<text x="-24.13" y="-8.89" size="1.778" layer="25">&gt;NAME</text>
<text x="3.81" y="2.54" size="1.778" layer="27">&gt;VALUE</text>
<hole x="-32.53" y="3.66" drill="2.8"/>
<hole x="32.78" y="3.66" drill="2.8"/>
</package>
<package name="057-040-1" urn="urn:adsk.eagle:footprint:9167/1" library_version="2">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
series 057 contact pc board low profile headers&lt;p&gt;
straight</description>
<wire x1="-1.9" y1="-3.32" x2="-1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-3.32" x2="1.9" y2="-4.03" width="0.2032" layer="21"/>
<wire x1="-26.55" y1="-1.97" x2="-25.85" y2="-3.04" width="0.4064" layer="21"/>
<wire x1="-25.85" y1="-3.04" x2="-25.15" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-25.15" y1="-1.97" x2="-26.55" y2="-1.97" width="0.4064" layer="21"/>
<wire x1="-29.26" y1="-4.1" x2="-29.26" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-29.26" y1="-4.1" x2="29.26" y2="-4.1" width="0.2032" layer="21"/>
<wire x1="29.26" y1="-4.1" x2="29.26" y2="4.1" width="0.2032" layer="21"/>
<wire x1="29.26" y1="4.1" x2="-29.26" y2="4.1" width="0.2032" layer="21"/>
<wire x1="-28.46" y1="-3.3" x2="-28.46" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-28.46" y1="3.3" x2="28.46" y2="3.3" width="0.2032" layer="21"/>
<wire x1="28.46" y1="3.3" x2="28.46" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="28.46" y1="-3.3" x2="1.9" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-3.3" x2="-28.46" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="-29.26" y1="4.1" x2="-28.46" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-29.26" y1="-4.1" x2="-28.46" y2="-3.3" width="0.2032" layer="21"/>
<wire x1="29.26" y1="4.1" x2="28.46" y2="3.3" width="0.2032" layer="21"/>
<wire x1="28.46" y1="-3.3" x2="29.26" y2="-4.1" width="0.2032" layer="21"/>
<pad name="1" x="-24.13" y="-1.27" drill="1" shape="octagon"/>
<pad name="2" x="-24.13" y="1.27" drill="1" shape="octagon"/>
<pad name="3" x="-21.59" y="-1.27" drill="1" shape="octagon"/>
<pad name="4" x="-21.59" y="1.27" drill="1" shape="octagon"/>
<pad name="5" x="-19.05" y="-1.27" drill="1" shape="octagon"/>
<pad name="6" x="-19.05" y="1.27" drill="1" shape="octagon"/>
<pad name="7" x="-16.51" y="-1.27" drill="1" shape="octagon"/>
<pad name="8" x="-16.51" y="1.27" drill="1" shape="octagon"/>
<pad name="9" x="-13.97" y="-1.27" drill="1" shape="octagon"/>
<pad name="10" x="-13.97" y="1.27" drill="1" shape="octagon"/>
<pad name="11" x="-11.43" y="-1.27" drill="1" shape="octagon"/>
<pad name="12" x="-11.43" y="1.27" drill="1" shape="octagon"/>
<pad name="13" x="-8.89" y="-1.27" drill="1" shape="octagon"/>
<pad name="14" x="-8.89" y="1.27" drill="1" shape="octagon"/>
<pad name="15" x="-6.35" y="-1.27" drill="1" shape="octagon"/>
<pad name="16" x="-6.35" y="1.27" drill="1" shape="octagon"/>
<pad name="17" x="-3.81" y="-1.27" drill="1" shape="octagon"/>
<pad name="18" x="-3.81" y="1.27" drill="1" shape="octagon"/>
<pad name="19" x="-1.27" y="-1.27" drill="1" shape="octagon"/>
<pad name="20" x="-1.27" y="1.27" drill="1" shape="octagon"/>
<pad name="21" x="1.27" y="-1.27" drill="1" shape="octagon"/>
<pad name="22" x="1.27" y="1.27" drill="1" shape="octagon"/>
<pad name="23" x="3.81" y="-1.27" drill="1" shape="octagon"/>
<pad name="24" x="3.81" y="1.27" drill="1" shape="octagon"/>
<pad name="25" x="6.35" y="-1.27" drill="1" shape="octagon"/>
<pad name="26" x="6.35" y="1.27" drill="1" shape="octagon"/>
<pad name="27" x="8.89" y="-1.27" drill="1" shape="octagon"/>
<pad name="28" x="8.89" y="1.27" drill="1" shape="octagon"/>
<pad name="29" x="11.43" y="-1.27" drill="1" shape="octagon"/>
<pad name="30" x="11.43" y="1.27" drill="1" shape="octagon"/>
<pad name="31" x="13.97" y="-1.27" drill="1" shape="octagon"/>
<pad name="32" x="13.97" y="1.27" drill="1" shape="octagon"/>
<pad name="33" x="16.51" y="-1.27" drill="1" shape="octagon"/>
<pad name="34" x="16.51" y="1.27" drill="1" shape="octagon"/>
<pad name="35" x="19.05" y="-1.27" drill="1" shape="octagon"/>
<pad name="36" x="19.05" y="1.27" drill="1" shape="octagon"/>
<pad name="37" x="21.59" y="-1.27" drill="1" shape="octagon"/>
<pad name="38" x="21.59" y="1.27" drill="1" shape="octagon"/>
<pad name="39" x="24.13" y="-1.27" drill="1" shape="octagon"/>
<pad name="40" x="24.13" y="1.27" drill="1" shape="octagon"/>
<text x="-24.11" y="-6.88" size="1.778" layer="25">&gt;NAME</text>
<text x="-24.86" y="4.55" size="1.778" layer="27">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="057-040-0" urn="urn:adsk.eagle:package:9187/1" type="box" library_version="2">
<description>CONNECTOR
series 057 contact pc board low profile headers
angled</description>
<packageinstances>
<packageinstance name="057-040-0"/>
</packageinstances>
</package3d>
<package3d name="057-040-1" urn="urn:adsk.eagle:package:9186/1" type="box" library_version="2">
<description>CONNECTOR
series 057 contact pc board low profile headers
straight</description>
<packageinstances>
<packageinstance name="057-040-1"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="MV" urn="urn:adsk.eagle:symbol:9158/1" library_version="2">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-2.54" y="1.905" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M" urn="urn:adsk.eagle:symbol:9159/1" library_version="2">
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.1524" layer="94"/>
<text x="1.016" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="057-040-" urn="urn:adsk.eagle:component:9210/2" prefix="X" library_version="2">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
40-pin series 057 contact pc board low profile headers</description>
<gates>
<gate name="-1" symbol="MV" x="-10.16" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="12.7" y="43.18" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="-10.16" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="12.7" y="38.1" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="-10.16" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="12.7" y="33.02" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="-10.16" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="12.7" y="27.94" addlevel="always" swaplevel="1"/>
<gate name="-9" symbol="M" x="-10.16" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-10" symbol="M" x="12.7" y="22.86" addlevel="always" swaplevel="1"/>
<gate name="-11" symbol="M" x="-10.16" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-12" symbol="M" x="12.7" y="17.78" addlevel="always" swaplevel="1"/>
<gate name="-13" symbol="M" x="-10.16" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-14" symbol="M" x="12.7" y="12.7" addlevel="always" swaplevel="1"/>
<gate name="-15" symbol="M" x="-10.16" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-16" symbol="M" x="12.7" y="7.62" addlevel="always" swaplevel="1"/>
<gate name="-17" symbol="M" x="-10.16" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-18" symbol="M" x="12.7" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-19" symbol="M" x="-10.16" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-20" symbol="M" x="12.7" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-21" symbol="M" x="-10.16" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-22" symbol="M" x="12.7" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-23" symbol="M" x="-10.16" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-24" symbol="M" x="12.7" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-25" symbol="M" x="-10.16" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-26" symbol="M" x="12.7" y="-17.78" addlevel="always" swaplevel="1"/>
<gate name="-27" symbol="M" x="-10.16" y="-22.86" addlevel="always" swaplevel="1"/>
<gate name="-28" symbol="M" x="12.7" y="-22.86" addlevel="always" swaplevel="1"/>
<gate name="-29" symbol="M" x="-10.16" y="-27.94" addlevel="always" swaplevel="1"/>
<gate name="-30" symbol="M" x="12.7" y="-27.94" addlevel="always" swaplevel="1"/>
<gate name="-31" symbol="M" x="-10.16" y="-33.02" addlevel="always" swaplevel="1"/>
<gate name="-32" symbol="M" x="12.7" y="-33.02" addlevel="always" swaplevel="1"/>
<gate name="-33" symbol="M" x="-10.16" y="-38.1" addlevel="always" swaplevel="1"/>
<gate name="-34" symbol="M" x="12.7" y="-38.1" addlevel="always" swaplevel="1"/>
<gate name="-35" symbol="M" x="-10.16" y="-43.18" addlevel="always" swaplevel="1"/>
<gate name="-36" symbol="M" x="12.7" y="-43.18" addlevel="always" swaplevel="1"/>
<gate name="-37" symbol="M" x="-10.16" y="-48.26" addlevel="always" swaplevel="1"/>
<gate name="-38" symbol="M" x="12.7" y="-48.26" addlevel="always" swaplevel="1"/>
<gate name="-39" symbol="M" x="-10.16" y="-53.34" addlevel="always" swaplevel="1"/>
<gate name="-40" symbol="M" x="12.7" y="-53.34" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="0" package="057-040-0">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-21" pin="S" pad="21"/>
<connect gate="-22" pin="S" pad="22"/>
<connect gate="-23" pin="S" pad="23"/>
<connect gate="-24" pin="S" pad="24"/>
<connect gate="-25" pin="S" pad="25"/>
<connect gate="-26" pin="S" pad="26"/>
<connect gate="-27" pin="S" pad="27"/>
<connect gate="-28" pin="S" pad="28"/>
<connect gate="-29" pin="S" pad="29"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-30" pin="S" pad="30"/>
<connect gate="-31" pin="S" pad="31"/>
<connect gate="-32" pin="S" pad="32"/>
<connect gate="-33" pin="S" pad="33"/>
<connect gate="-34" pin="S" pad="34"/>
<connect gate="-35" pin="S" pad="35"/>
<connect gate="-36" pin="S" pad="36"/>
<connect gate="-37" pin="S" pad="37"/>
<connect gate="-38" pin="S" pad="38"/>
<connect gate="-39" pin="S" pad="39"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-40" pin="S" pad="40"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:9187/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="1" package="057-040-1">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-10" pin="S" pad="10"/>
<connect gate="-11" pin="S" pad="11"/>
<connect gate="-12" pin="S" pad="12"/>
<connect gate="-13" pin="S" pad="13"/>
<connect gate="-14" pin="S" pad="14"/>
<connect gate="-15" pin="S" pad="15"/>
<connect gate="-16" pin="S" pad="16"/>
<connect gate="-17" pin="S" pad="17"/>
<connect gate="-18" pin="S" pad="18"/>
<connect gate="-19" pin="S" pad="19"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-20" pin="S" pad="20"/>
<connect gate="-21" pin="S" pad="21"/>
<connect gate="-22" pin="S" pad="22"/>
<connect gate="-23" pin="S" pad="23"/>
<connect gate="-24" pin="S" pad="24"/>
<connect gate="-25" pin="S" pad="25"/>
<connect gate="-26" pin="S" pad="26"/>
<connect gate="-27" pin="S" pad="27"/>
<connect gate="-28" pin="S" pad="28"/>
<connect gate="-29" pin="S" pad="29"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-30" pin="S" pad="30"/>
<connect gate="-31" pin="S" pad="31"/>
<connect gate="-32" pin="S" pad="32"/>
<connect gate="-33" pin="S" pad="33"/>
<connect gate="-34" pin="S" pad="34"/>
<connect gate="-35" pin="S" pad="35"/>
<connect gate="-36" pin="S" pad="36"/>
<connect gate="-37" pin="S" pad="37"/>
<connect gate="-38" pin="S" pad="38"/>
<connect gate="-39" pin="S" pad="39"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-40" pin="S" pad="40"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
<connect gate="-9" pin="S" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:9186/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-phoenix-254" urn="urn:adsk.eagle:library:172">
<description>&lt;b&gt;Phoenix Connectors&lt;/b&gt;&lt;p&gt;
Grid 2.54 mm&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="8POL254" urn="urn:adsk.eagle:footprint:9311/1" library_version="2">
<description>&lt;b&gt;PHOENIX CONNECTOR&lt;/b&gt;</description>
<wire x1="-10.29" y1="-1.45" x2="10.29" y2="-1.45" width="0.254" layer="21"/>
<wire x1="10.29" y1="-1.45" x2="10.29" y2="1.45" width="0.254" layer="21"/>
<wire x1="10.29" y1="1.45" x2="-10.29" y2="1.45" width="0.254" layer="21"/>
<wire x1="-10.29" y1="1.45" x2="-10.29" y2="-1.45" width="0.254" layer="21"/>
<wire x1="-10.18" y1="1.1" x2="10.18" y2="1.1" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-0.508" x2="-8.382" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-7.112" y1="-0.254" x2="-5.588" y2="0.127" width="0.1524" layer="51"/>
<wire x1="-4.318" y1="0.635" x2="-3.302" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="0.381" x2="-0.508" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="0.762" y1="0.635" x2="1.778" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="3.048" y1="0.381" x2="4.572" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="5.842" y1="0.635" x2="6.858" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="8.255" y1="-0.508" x2="9.398" y2="0.635" width="0.1524" layer="51"/>
<circle x="-8.89" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-6.35" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-3.81" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="1.27" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="3.81" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="6.35" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="8.89" y="0" radius="0.889" width="0.1524" layer="51"/>
<pad name="1" x="-8.89" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1.2" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1.2" shape="long" rot="R90"/>
<text x="-10.414" y="1.778" size="1.27" layer="25">&gt;NAME</text>
<text x="-10.414" y="-3.048" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="8POL254" urn="urn:adsk.eagle:package:9329/1" type="box" library_version="2">
<description>PHOENIX CONNECTOR</description>
<packageinstances>
<packageinstance name="8POL254"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="SKB" urn="urn:adsk.eagle:symbol:9303/1" library_version="2">
<wire x1="2.032" y1="0.762" x2="0.508" y2="-0.762" width="0.254" layer="94"/>
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="3.556" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
<symbol name="SKBV" urn="urn:adsk.eagle:symbol:9304/1" library_version="2">
<wire x1="2.032" y1="0.762" x2="0.508" y2="-0.762" width="0.254" layer="94"/>
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="3.556" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.016" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MPT8" urn="urn:adsk.eagle:component:9335/2" prefix="X" uservalue="yes" library_version="2">
<description>&lt;b&gt;PHOENIX CONNECTOR&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="SKB" x="0" y="12.7" addlevel="always"/>
<gate name="-2" symbol="SKB" x="0" y="7.62" addlevel="always"/>
<gate name="-3" symbol="SKB" x="0" y="2.54" addlevel="always"/>
<gate name="-4" symbol="SKB" x="0" y="-2.54" addlevel="always"/>
<gate name="-5" symbol="SKB" x="22.86" y="12.7" addlevel="always"/>
<gate name="-6" symbol="SKB" x="22.86" y="7.62" addlevel="always"/>
<gate name="-7" symbol="SKB" x="22.86" y="2.54" addlevel="always"/>
<gate name="-8" symbol="SKBV" x="22.86" y="-2.54" addlevel="always"/>
</gates>
<devices>
<device name="" package="8POL254">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-2" pin="1" pad="2"/>
<connect gate="-3" pin="1" pad="3"/>
<connect gate="-4" pin="1" pad="4"/>
<connect gate="-5" pin="1" pad="5"/>
<connect gate="-6" pin="1" pad="6"/>
<connect gate="-7" pin="1" pad="7"/>
<connect gate="-8" pin="1" pad="8"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:9329/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
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
<part name="X1" library="con-panduit" library_urn="urn:adsk.eagle:library:169" deviceset="057-040-" device="1" package3d_urn="urn:adsk.eagle:package:9186/1"/>
<part name="X2" library="con-phoenix-254" library_urn="urn:adsk.eagle:library:172" deviceset="MPT8" device="" package3d_urn="urn:adsk.eagle:package:9329/1"/>
<part name="X3" library="con-phoenix-254" library_urn="urn:adsk.eagle:library:172" deviceset="MPT8" device="" package3d_urn="urn:adsk.eagle:package:9329/1"/>
<part name="X4" library="con-phoenix-254" library_urn="urn:adsk.eagle:library:172" deviceset="MPT8" device="" package3d_urn="urn:adsk.eagle:package:9329/1"/>
<part name="X5" library="con-phoenix-254" library_urn="urn:adsk.eagle:library:172" deviceset="MPT8" device="" package3d_urn="urn:adsk.eagle:package:9329/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="X1" gate="-1" x="48.26" y="99.06" smashed="yes">
<attribute name="NAME" x="49.276" y="98.298" size="1.524" layer="95"/>
<attribute name="VALUE" x="45.72" y="100.965" size="1.778" layer="96"/>
</instance>
<instance part="X1" gate="-2" x="71.12" y="99.06" smashed="yes">
<attribute name="NAME" x="72.136" y="98.298" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-3" x="48.26" y="93.98" smashed="yes">
<attribute name="NAME" x="49.276" y="93.218" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-4" x="71.12" y="93.98" smashed="yes">
<attribute name="NAME" x="72.136" y="93.218" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-5" x="48.26" y="88.9" smashed="yes">
<attribute name="NAME" x="49.276" y="88.138" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-6" x="71.12" y="88.9" smashed="yes">
<attribute name="NAME" x="72.136" y="88.138" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-7" x="48.26" y="83.82" smashed="yes">
<attribute name="NAME" x="49.276" y="83.058" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-8" x="71.12" y="83.82" smashed="yes">
<attribute name="NAME" x="72.136" y="83.058" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-9" x="48.26" y="78.74" smashed="yes">
<attribute name="NAME" x="49.276" y="77.978" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-10" x="71.12" y="78.74" smashed="yes">
<attribute name="NAME" x="72.136" y="77.978" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-11" x="48.26" y="73.66" smashed="yes">
<attribute name="NAME" x="49.276" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-12" x="71.12" y="73.66" smashed="yes">
<attribute name="NAME" x="72.136" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-13" x="48.26" y="68.58" smashed="yes">
<attribute name="NAME" x="49.276" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-14" x="71.12" y="68.58" smashed="yes">
<attribute name="NAME" x="72.136" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-15" x="48.26" y="63.5" smashed="yes">
<attribute name="NAME" x="49.276" y="62.738" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-16" x="71.12" y="63.5" smashed="yes">
<attribute name="NAME" x="72.136" y="62.738" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-17" x="48.26" y="58.42" smashed="yes">
<attribute name="NAME" x="49.276" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-18" x="71.12" y="58.42" smashed="yes">
<attribute name="NAME" x="72.136" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-19" x="48.26" y="53.34" smashed="yes">
<attribute name="NAME" x="49.276" y="52.578" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-20" x="71.12" y="53.34" smashed="yes">
<attribute name="NAME" x="72.136" y="52.578" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-21" x="48.26" y="48.26" smashed="yes">
<attribute name="NAME" x="49.276" y="47.498" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-22" x="71.12" y="48.26" smashed="yes">
<attribute name="NAME" x="72.136" y="47.498" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-23" x="48.26" y="43.18" smashed="yes">
<attribute name="NAME" x="49.276" y="42.418" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-24" x="71.12" y="43.18" smashed="yes">
<attribute name="NAME" x="72.136" y="42.418" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-25" x="48.26" y="38.1" smashed="yes">
<attribute name="NAME" x="49.276" y="37.338" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-26" x="71.12" y="38.1" smashed="yes">
<attribute name="NAME" x="72.136" y="37.338" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-27" x="48.26" y="33.02" smashed="yes">
<attribute name="NAME" x="49.276" y="32.258" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-28" x="71.12" y="33.02" smashed="yes">
<attribute name="NAME" x="72.136" y="32.258" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-29" x="48.26" y="27.94" smashed="yes">
<attribute name="NAME" x="49.276" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-30" x="71.12" y="27.94" smashed="yes">
<attribute name="NAME" x="72.136" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-31" x="48.26" y="22.86" smashed="yes">
<attribute name="NAME" x="49.276" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-32" x="71.12" y="22.86" smashed="yes">
<attribute name="NAME" x="72.136" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-33" x="48.26" y="17.78" smashed="yes">
<attribute name="NAME" x="49.276" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-34" x="71.12" y="17.78" smashed="yes">
<attribute name="NAME" x="72.136" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-35" x="48.26" y="12.7" smashed="yes">
<attribute name="NAME" x="49.276" y="11.938" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-36" x="71.12" y="12.7" smashed="yes">
<attribute name="NAME" x="72.136" y="11.938" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-37" x="48.26" y="7.62" smashed="yes">
<attribute name="NAME" x="49.276" y="6.858" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-38" x="71.12" y="7.62" smashed="yes">
<attribute name="NAME" x="72.136" y="6.858" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-39" x="48.26" y="2.54" smashed="yes">
<attribute name="NAME" x="49.276" y="1.778" size="1.524" layer="95"/>
</instance>
<instance part="X1" gate="-40" x="71.12" y="2.54" smashed="yes">
<attribute name="NAME" x="72.136" y="1.778" size="1.524" layer="95"/>
</instance>
<instance part="X2" gate="-1" x="30.48" y="99.06" smashed="yes">
<attribute name="NAME" x="34.036" y="98.425" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-2" x="96.52" y="99.06" smashed="yes">
<attribute name="NAME" x="100.076" y="98.425" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-3" x="27.94" y="93.98" smashed="yes">
<attribute name="NAME" x="31.496" y="93.345" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-4" x="93.98" y="93.98" smashed="yes">
<attribute name="NAME" x="97.536" y="93.345" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-5" x="30.48" y="88.9" smashed="yes">
<attribute name="NAME" x="34.036" y="88.265" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-6" x="93.98" y="88.9" smashed="yes">
<attribute name="NAME" x="97.536" y="88.265" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-7" x="30.48" y="83.82" smashed="yes">
<attribute name="NAME" x="34.036" y="83.185" size="1.778" layer="95"/>
</instance>
<instance part="X2" gate="-8" x="91.44" y="83.82" smashed="yes">
<attribute name="NAME" x="94.996" y="83.185" size="1.778" layer="95"/>
<attribute name="VALUE" x="90.424" y="80.518" size="1.778" layer="96"/>
</instance>
<instance part="X3" gate="-1" x="30.48" y="78.74" smashed="yes">
<attribute name="NAME" x="34.036" y="78.105" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-2" x="91.44" y="78.74" smashed="yes">
<attribute name="NAME" x="94.996" y="78.105" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-3" x="30.48" y="73.66" smashed="yes">
<attribute name="NAME" x="34.036" y="73.025" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-4" x="93.98" y="73.66" smashed="yes">
<attribute name="NAME" x="97.536" y="73.025" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-5" x="33.02" y="68.58" smashed="yes">
<attribute name="NAME" x="36.576" y="67.945" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-6" x="81.28" y="68.58" smashed="yes">
<attribute name="NAME" x="84.836" y="67.945" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-7" x="27.94" y="63.5" smashed="yes">
<attribute name="NAME" x="31.496" y="62.865" size="1.778" layer="95"/>
</instance>
<instance part="X3" gate="-8" x="91.44" y="63.5" smashed="yes">
<attribute name="NAME" x="94.996" y="62.865" size="1.778" layer="95"/>
<attribute name="VALUE" x="90.424" y="60.198" size="1.778" layer="96"/>
</instance>
<instance part="X4" gate="-1" x="30.48" y="58.42" smashed="yes">
<attribute name="NAME" x="34.036" y="57.785" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-2" x="91.44" y="58.42" smashed="yes">
<attribute name="NAME" x="94.996" y="57.785" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-3" x="33.02" y="53.34" smashed="yes">
<attribute name="NAME" x="36.576" y="52.705" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-4" x="91.44" y="53.34" smashed="yes">
<attribute name="NAME" x="94.996" y="52.705" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-5" x="35.56" y="48.26" smashed="yes">
<attribute name="NAME" x="39.116" y="47.625" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-6" x="91.44" y="48.26" smashed="yes">
<attribute name="NAME" x="94.996" y="47.625" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-7" x="35.56" y="43.18" smashed="yes">
<attribute name="NAME" x="39.116" y="42.545" size="1.778" layer="95"/>
</instance>
<instance part="X4" gate="-8" x="93.98" y="43.18" smashed="yes">
<attribute name="NAME" x="97.536" y="42.545" size="1.778" layer="95"/>
<attribute name="VALUE" x="92.964" y="39.878" size="1.778" layer="96"/>
</instance>
<instance part="X5" gate="-1" x="33.02" y="38.1" smashed="yes">
<attribute name="NAME" x="36.576" y="37.465" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-2" x="88.9" y="38.1" smashed="yes">
<attribute name="NAME" x="92.456" y="37.465" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-3" x="33.02" y="33.02" smashed="yes">
<attribute name="NAME" x="36.576" y="32.385" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-4" x="91.44" y="33.02" smashed="yes">
<attribute name="NAME" x="94.996" y="32.385" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-5" x="30.48" y="27.94" smashed="yes">
<attribute name="NAME" x="34.036" y="27.305" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-6" x="93.98" y="27.94" smashed="yes">
<attribute name="NAME" x="97.536" y="27.305" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-7" x="33.02" y="22.86" smashed="yes">
<attribute name="NAME" x="36.576" y="22.225" size="1.778" layer="95"/>
</instance>
<instance part="X5" gate="-8" x="91.44" y="22.86" smashed="yes">
<attribute name="NAME" x="94.996" y="22.225" size="1.778" layer="95"/>
<attribute name="VALUE" x="90.424" y="19.558" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="X1" gate="-1" pin="S"/>
<pinref part="X2" gate="-1" pin="1"/>
<wire x1="27.94" y1="99.06" x2="43.18" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="X1" gate="-2" pin="S"/>
<pinref part="X2" gate="-2" pin="1"/>
<wire x1="93.98" y1="99.06" x2="66.04" y2="99.06" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X1" gate="-3" pin="S"/>
<pinref part="X2" gate="-3" pin="1"/>
<wire x1="25.4" y1="93.98" x2="43.18" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="X1" gate="-4" pin="S"/>
<pinref part="X2" gate="-4" pin="1"/>
<wire x1="66.04" y1="93.98" x2="91.44" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="X1" gate="-5" pin="S"/>
<pinref part="X2" gate="-5" pin="1"/>
<wire x1="27.94" y1="88.9" x2="43.18" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="X1" gate="-6" pin="S"/>
<pinref part="X2" gate="-6" pin="1"/>
<wire x1="91.44" y1="88.9" x2="66.04" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="X1" gate="-7" pin="S"/>
<pinref part="X2" gate="-7" pin="1"/>
<wire x1="27.94" y1="83.82" x2="43.18" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="X1" gate="-8" pin="S"/>
<pinref part="X2" gate="-8" pin="1"/>
<wire x1="88.9" y1="83.82" x2="66.04" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="X1" gate="-9" pin="S"/>
<pinref part="X3" gate="-1" pin="1"/>
<wire x1="43.18" y1="78.74" x2="27.94" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="X1" gate="-10" pin="S"/>
<pinref part="X3" gate="-2" pin="1"/>
<wire x1="88.9" y1="78.74" x2="66.04" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="X1" gate="-11" pin="S"/>
<pinref part="X3" gate="-3" pin="1"/>
<wire x1="27.94" y1="73.66" x2="43.18" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="X1" gate="-12" pin="S"/>
<pinref part="X3" gate="-4" pin="1"/>
<wire x1="66.04" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="X1" gate="-13" pin="S"/>
<pinref part="X3" gate="-5" pin="1"/>
<wire x1="30.48" y1="68.58" x2="43.18" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="X1" gate="-14" pin="S"/>
<pinref part="X3" gate="-6" pin="1"/>
<wire x1="78.74" y1="68.58" x2="66.04" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="X1" gate="-15" pin="S"/>
<pinref part="X3" gate="-7" pin="1"/>
<wire x1="25.4" y1="63.5" x2="43.18" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="X1" gate="-16" pin="S"/>
<pinref part="X3" gate="-8" pin="1"/>
<wire x1="88.9" y1="63.5" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="X1" gate="-17" pin="S"/>
<pinref part="X4" gate="-1" pin="1"/>
<wire x1="27.94" y1="58.42" x2="43.18" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="X1" gate="-18" pin="S"/>
<pinref part="X4" gate="-2" pin="1"/>
<wire x1="88.9" y1="58.42" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="X1" gate="-19" pin="S"/>
<pinref part="X4" gate="-3" pin="1"/>
<wire x1="30.48" y1="53.34" x2="43.18" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="X1" gate="-20" pin="S"/>
<pinref part="X4" gate="-4" pin="1"/>
<wire x1="88.9" y1="53.34" x2="66.04" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="X1" gate="-21" pin="S"/>
<pinref part="X4" gate="-5" pin="1"/>
<wire x1="33.02" y1="48.26" x2="43.18" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="X1" gate="-22" pin="S"/>
<pinref part="X4" gate="-6" pin="1"/>
<wire x1="88.9" y1="48.26" x2="66.04" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="X1" gate="-23" pin="S"/>
<pinref part="X4" gate="-7" pin="1"/>
<wire x1="33.02" y1="43.18" x2="43.18" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="X1" gate="-24" pin="S"/>
<pinref part="X4" gate="-8" pin="1"/>
<wire x1="91.44" y1="43.18" x2="66.04" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="X1" gate="-25" pin="S"/>
<pinref part="X5" gate="-1" pin="1"/>
<wire x1="30.48" y1="38.1" x2="43.18" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="X1" gate="-26" pin="S"/>
<pinref part="X5" gate="-2" pin="1"/>
<wire x1="86.36" y1="38.1" x2="66.04" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="X1" gate="-27" pin="S"/>
<pinref part="X5" gate="-3" pin="1"/>
<wire x1="30.48" y1="33.02" x2="43.18" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="X1" gate="-28" pin="S"/>
<pinref part="X5" gate="-4" pin="1"/>
<wire x1="88.9" y1="33.02" x2="66.04" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="X1" gate="-29" pin="S"/>
<pinref part="X5" gate="-5" pin="1"/>
<wire x1="27.94" y1="27.94" x2="43.18" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="X1" gate="-30" pin="S"/>
<pinref part="X5" gate="-6" pin="1"/>
<wire x1="91.44" y1="27.94" x2="66.04" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<pinref part="X1" gate="-31" pin="S"/>
<pinref part="X5" gate="-7" pin="1"/>
<wire x1="30.48" y1="22.86" x2="43.18" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="X1" gate="-32" pin="S"/>
<pinref part="X5" gate="-8" pin="1"/>
<wire x1="88.9" y1="22.86" x2="66.04" y2="22.86" width="0.1524" layer="91"/>
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
