const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#371220", /* black   */
  [1] = "#617489", /* red     */
  [2] = "#C1778A", /* green   */
  [3] = "#178D8E", /* yellow  */
  [4] = "#2F8B8C", /* blue    */
  [5] = "#4F9391", /* magenta */
  [6] = "#659E9E", /* cyan    */
  [7] = "#a8d9d9", /* white   */

  /* 8 bright colors */
  [8]  = "#759797",  /* black   */
  [9]  = "#617489",  /* red     */
  [10] = "#C1778A", /* green   */
  [11] = "#178D8E", /* yellow  */
  [12] = "#2F8B8C", /* blue    */
  [13] = "#4F9391", /* magenta */
  [14] = "#659E9E", /* cyan    */
  [15] = "#a8d9d9", /* white   */

  /* special colors */
  [256] = "#371220", /* background */
  [257] = "#a8d9d9", /* foreground */
  [258] = "#a8d9d9",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
