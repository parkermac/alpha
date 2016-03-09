function [Tdir] = toolstart
% toolstart.m  6/26/2014  Parker MacCready
%
% A function to be invoked at the start of any primary code in the "tools"
% system.
%
% It sets required paths and returns a structure "Tdir" with locations of
% useful directories.
%
% This is intended to be hopefully the ONLY place a user of the tools code
% collections would have to set machine-dependent paths and file locations
%
% copyright Parker MacCready 2011, released under the BSD license

% NOTES:
%
% 6/26/2014 Changed some folder names in tools_data, dropping the obsolete
% prefix "mossea_".
% Also changed seom folder names in tools_output, changing "mossea_"
% to "rtools_" so now output is written to: rtools_grids/
% and rtools_run_files/.
% These changes were also implemented in toolstart.m and several places in
% the rtools "grid" and "runs" code.

% &&&&&&&&& USER EDIT THIS IF NEEDED &&&&&&&&&&&&&&&&
% This is designed so that it should not have to
% be changed at all when moving to different systems, as long
% as the suggested directory structure is maintained
this_dir = pwd; t_ind = strfind(this_dir,'/tools');
Tdir.tools_parent = this_dir(1:t_ind);
cd('~'); Tdir.home = [pwd,'/']; cd(this_dir);
% NOTE 6/1/2012 The code as written above should work from anywhere within
% the directories tools, tools_data, tools_output, and anywhere else whose
% name starts with tools - as long as it is at the same level.
% &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

% these may not have to be changed at all if you are using the suggested
% tools directory structure
%
% upper level places:
Tdir.tools = [Tdir.tools_parent,'tools/'];
Tdir.data = [Tdir.tools_parent,'tools_data/'];
Tdir.output = [Tdir.tools_parent,'tools_output/'];
% make sure that the output directory exists
if ~exist(Tdir.output,'dir'); mkdir(Tdir.output); end;

% more specific places:
Tdir.rtools = [Tdir.tools,'rtools/'];
% data places
Tdir.coast = [Tdir.data,'geo_data/coast/'];
Tdir.topo = [Tdir.data,'geo_data/topo/'];
Tdir.atm = [Tdir.data,'forcing_data/atm/'];
Tdir.river = [Tdir.data,'forcing_data/river/'];
Tdir.tide = [Tdir.data,'forcing_data/tide/'];
Tdir.ocn = [Tdir.data,'forcing_data/ocn/'];

% paths to shared code assumed to be available by many programs
% addpath([Tdir.rtools,'Z_utils']); % no longer exists
addpath([Tdir.tools,'shared/mexcdf/mexnc']);
addpath([Tdir.tools,'shared/mexcdf/snctools']);
addpath([Tdir.tools,'shared/seawater']);
addpath([Tdir.tools,'shared/t_tide_v1']);
addpath([Tdir.tools,'pandora/Z_functions']);
addpath([Tdir.tools,'post_tools/obs']);
addpath([Tdir.tools,'post_tools/roms']);
addpath([Tdir.tools,'post_tools/utility']);



