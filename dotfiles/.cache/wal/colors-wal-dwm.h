static const char norm_fg[] = "#a8d9d9";
static const char norm_bg[] = "#371220";
static const char norm_border[] = "#759797";

static const char sel_fg[] = "#a8d9d9";
static const char sel_bg[] = "#C1778A";
static const char sel_border[] = "#a8d9d9";

static const char urg_fg[] = "#a8d9d9";
static const char urg_bg[] = "#617489";
static const char urg_border[] = "#617489";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
