
mod front_of_house;

pub use crate::front_of_house::hosting as host;
// use std::{self,cmp::Ordering,io};

pub fn eat_at_restaurant(){
    // // 绝对路径
    // crate::front_of_house::hosting::add_to_waitlist();

    // // 相对路径
    // front_of_house::hosting::add_to_waitlist();
    host::add_to_waitlist();
}


