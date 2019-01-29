use <text.scad>
include <text_size.scad>


difference () {
    translate(text_size_offset()) cube(text_size_dims());
    make_my_text();
}
