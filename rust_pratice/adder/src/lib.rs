// pub fn add(left: usize, right: usize) -> usize {
//     left + right
// }

// #[cfg(test)]
// mod tests {
//     // use super::*;

//     // #[test]
//     // fn it_works() {
//     //     let result = add(2, 2);
//     //     assert_eq!(result, 4);
//     // }
//     #[test]
//     fn exploration(){
//         assert_eq!(2+2,4);
//     }

//     #[test]
//     fn another(){
//         panic!("make this test fail");
//     }
// }

// #[derive(Debug)]
// struct Rectangle{
//     width: u32,
//     height:u32,
// }

// impl Rectangle{
//     fn can_hold(&self,other:&Rectangle) -> bool{
//         self.width > other.width && self.height > other.height
//     }
// }

// #[cfg(test)]
// mod tests {
//     use super::*;

//     #[test]
//     fn larger_can_hold_smaller() {
//         let larger = Rectangle {
//             width: 8,
//             height: 7,
//         };
//         let smaller = Rectangle {
//             width: 5,
//             height: 1,
//         };

//         assert!(larger.can_hold(&smaller));
//     }
// }

pub fn greeting(name:&str) -> String{
    format!("Hello!")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn greeting_contains_name() {
        let result = greeting("Carol");
        assert!(
            result.contains("Carol"),
            "Greetin did not contain name,value,was,`{}`",
            result
        );
    }
}
