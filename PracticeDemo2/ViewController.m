//
//  ViewController.m
//  PracticeDemo2
//
//  Created by wanhouhong on 2017/8/25.
//  Copyright © 2017年 wanhouhong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 60 + i * (40 + 10), [UIScreen mainScreen].bounds.size.width - 40 * 2, 40)];
        btn.layer.cornerRadius = 8.f;
        btn.layer.borderWidth = 1.f;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        NSString *tempStr;
        switch (i) {
            case 0:
                tempStr = @"NSMutableDictionaryTest";
                break;
            case 1:
                tempStr = @"NSDictionaryTest";
                break;
            case 2:
                tempStr = @"NSMutableArrayTest";
                break;
            case 3:
                tempStr = @"NSArrayTest";
                break;
            default:
                break;
        }
        [btn setTitle:tempStr forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(safeTest:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:btn];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)safeTest:(id)sender {
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 0:
            [self NSMutableDictionaryTest];
            break;
        case 1:
            [self NSDictionaryTest];
            break;
        case 2:
            [self NSMutableArrayTest];
            break;
        case 3:
            [self NSArrayTest];
            break;
        default:
            break;
    }
}

- (void)NSMutableDictionaryTest {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:@{@"name":@"fantasy",@"sex":@"male"}];
    NSString *str = NULL;
    NSString *value = NULL;
    NSString *key = NULL;
    [dic setObject:str forKey:key];
    [dic setObject:@"test" forKey:key];
    [dic setObject:str forKey:@"key"];
    [dic setValue:value forKey:key];
    
    [dic removeObjectForKey:key];
}

- (void)NSDictionaryTest {
    NSDictionary *dic = @{@"name":@"fantasy",@"sex":@"male"};
    NSString *key = NULL;
    NSString *tempStr = [dic objectForKey:key];
    NSLog(@"%@", tempStr);
}

- (void)NSMutableArrayTest {
    NSMutableArray *arr1 = [[NSMutableArray alloc] initWithObjects:@"a", @"b",@"c",nil];
    NSMutableArray *arr2 = [[NSMutableArray alloc] init];
    id object = NULL;
    [arr1 addObject:object];
    [arr1 removeObjectAtIndex:5];
    [arr1 insertObject:object atIndex:2];
    [arr1 insertObject:@"1" atIndex:5];
    [arr1 insertObject:@"1" atIndex:2];
    [arr1 objectAtIndex:5];
    [arr2 objectAtIndex:1];
}

- (void)NSArrayTest {
    NSArray *arr = @[@"1", @"2", @"3"];
    NSArray *arr1 = [[NSArray alloc] init];
    [arr1 objectAtIndex:1];
    [arr objectAtIndex:-1];
    [arr objectAtIndex:3];
}


@end
