% default figure properties
defaultfigureproperties;

% email preferences
setpref('Internet','E_mail','nirum@stanford.edu');
setpref('Internet','SMTP_Server','mail');

% turn beep off
beep off;

% number format
format short g

% Add additional directories to the path
setenv('PATH', [getenv('PATH') ':/usr/local/bin:/usr/texbin']);
setPathMatlabUtils;

% change directory
ccl;