SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `earphone` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `earphone` ;

-- -----------------------------------------------------
-- Table `earphone`.`Order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `earphone`.`Order` (
  `orderID` INT NOT NULL AUTO_INCREMENT ,
  `total` DOUBLE NULL ,
  `dateTime` VARCHAR(100) NULL ,
  PRIMARY KEY (`orderID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `earphone`.`Shipping`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `earphone`.`Shipping` (
  `shippingID` INT NOT NULL AUTO_INCREMENT ,
  `Order_orderID` INT NOT NULL ,
  `name` VARCHAR(25) NULL ,
  `street` VARCHAR(25) NULL ,
  `city` VARCHAR(25) NULL ,
  `state` VARCHAR(2) NULL ,
  `zip` INT NULL ,
  PRIMARY KEY (`shippingID`) ,
  INDEX `fk_Shipping_Order_idx` (`Order_orderID` ASC) ,
  CONSTRAINT `fk_Shipping_Order`
    FOREIGN KEY (`Order_orderID` )
    REFERENCES `earphone`.`Order` (`orderID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `earphone`.`Billing`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `earphone`.`Billing` (
  `billingID` INT NOT NULL AUTO_INCREMENT ,
  `Order_orderID` INT NOT NULL ,
  `email` VARCHAR(30) NULL ,
  `cardHolderName` VARCHAR(15) NULL ,
  `cardNumber` CHAR(16) NULL ,
  `expirationMonth` INT(2) NULL ,
  `expirationYear` INT(4) NULL ,
  `secureCode` INT(11) NULL ,
  PRIMARY KEY (`billingID`) ,
  INDEX `fk_Billing_Order1_idx` (`Order_orderID` ASC) ,
  CONSTRAINT `fk_Billing_Order1`
    FOREIGN KEY (`Order_orderID` )
    REFERENCES `earphone`.`Order` (`orderID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `earphone`.`Item`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `earphone`.`Item` (
  `itemID` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NULL ,
  `description` VARCHAR(255) NULL ,
  `specification` VARCHAR(255) NULL ,
  `photoName` VARCHAR(30) NULL ,
  `price` DOUBLE NULL ,
  PRIMARY KEY (`itemID`) );


-- -----------------------------------------------------
-- Table `earphone`.`orderLine`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `earphone`.`orderLine` (
  `orderlineID` INT NOT NULL AUTO_INCREMENT ,
  `Order_orderID` INT NOT NULL ,
  `quantity` INT(11) NULL ,
  `subtotal` DOUBLE NULL ,
  `Item_itemID` INT NOT NULL ,
  PRIMARY KEY (`orderlineID`) ,
  UNIQUE INDEX `orderlineID_UNIQUE` (`orderlineID` ASC) ,
  INDEX `fk_orderLine_Order1_idx` (`Order_orderID` ASC) ,
  INDEX `fk_orderLine_Item1_idx` (`Item_itemID` ASC) ,
  CONSTRAINT `fk_orderLine_Order1`
    FOREIGN KEY (`Order_orderID` )
    REFERENCES `earphone`.`Order` (`orderID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderLine_Item1`
    FOREIGN KEY (`Item_itemID` )
    REFERENCES `earphone`.`Item` (`itemID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `earphone` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `earphone`.`Item`
-- -----------------------------------------------------
START TRANSACTION;
USE `earphone`;
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (1, 'Apple EarPods', 'Unlike traditional, circular earbuds, the design of the Apple EarPods is defined by the geometry of the ear.', 'Enhanced Bass Response, Resistant to Sweat and Water Damage, Control Music and Video Playback', 'earpod.jpg', 24.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (2, 'Audio-Technica ATH-M50 Headphones', 'With the ATH-M50 professional studio monitor headphones, Audio-Technica has achieved an exceptionally accurate response and long-wearing listening comfort.', 'Exceptional audio quality for professional monitoring and mixing, adjustable padded headband for comfort during long mixing/recording sessions, 1 year warranty', 'ath.jpg', 159.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (3, 'Bose® QuietComfort® 15 Headphones', 'They\'re the best Bose headphones, period. QuietComfort 15 headphones feature exclusive Bose advancements in noise reduction technology.', 'Significant noise reduction, TriPort acoustic headphone structure, Active equalization', 'bqc.jpg', 299.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (4, 'Bose AE2w Bluetooth Headphones', 'AE2w Bluetooth headphones let you enjoy immersive Bose sound from your iPad-plus wireless freedom. ', 'Enjoy immersive sound with wireless freedom, Cushioned around-ear fit for hours of comfortable listening, Wirelessly connects to your Bluetooth devices', 'AE2w.jpg', 249.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (5, 'Beats Solo HD On-Ear Headphone', 'Beats Solo HD headphones are made to be a lighter, on-ear version of Studios. Compact enough to fit in your pocket or bag,', 'Every pair is now constructed of super-durable, flexible material, reinforced with a metal strip to make sure it never comes apart.', 'hp.jpg', 199.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (6, 'Jawbone ERA Bluetooth Headset - Shadowbox', 'The Jawbone ERA is the only Bluetooth headset equipped with military-grade NoiseAssassin 3.0, the latest version of Jawbone\'s industry-first noise and wind canceling technology.', 'Advanced Bluetooth headset in Shadowbox design with NoiseAssasin 3.0 noise and wind canceling technology for clear communication.', 'jb01.jpg', 77.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (7, 'Jawbone ERA Bluetooth  Headset - Midnight', 'The Jawbone ERA is the only Bluetooth headset equipped with military-grade NoiseAssassin 3.0, the latest version of Jawbone\'s industry-first noise and wind canceling technology.', 'Advanced Bluetooth headset in Shadowbox design with NoiseAssasin 3.0 noise and wind canceling technology for clear communication.', 'jb02.jpg', 77.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (8, 'JVC HAFX1X Headphones', 'The new three-model Xtreme Xplosives, or XX, series combines aggressive new design with JVC?s traditional high-quality build and style to meet the needs of today\'s music enthusiasts in comfort, sound and price.', 'Gold plated 3.5mm plug,Cord Length: 3.93ft(1.2m), Good quality, Noise reduction', 'jvc.jpg', 19.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (9, 'Logitech Wireless Gaming Headset G930 with 7.1 Surround Sound', 'Logitech wireless gaming headset g930 a fast wireless connection lets you level up without being tied down-and 7.1 surround sound puts you right in the middle of the action.', 'Gaming-grade wireless: Reliable lag-free performance with up to 40 ft. wireless range (Actual wireless range will vary with use, settings and environmental conditions). ', 'lg01.jpg', 109.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (10, 'Plantronics GameCom 780 Surround Sound Stereo PC Gaming Headset', 'Enjoy exceptional sound quality, whether you\'re playing video games, listening to music, or making Internet calls, with the GameCom 780 Surround Sound Gaming Headset from Plantronics.', 'Dolby Headphone and Pro Logic IIx technologies transform standard audio into a stunning 7.1 surround sound experience (Software is compatible with Windows systems only.', 'pg01.jpg', 54.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (11, 'Sennheiser HD 202 Professional Headphones', 'The HD 202-II is a closed-back, around-the-ear stereo headphone featuring powerful bass reproduction.', 'Ideal for DJ\\\"s and audio pros,Total harmonic distortion (THD): <0.5%, Very clean, deep bass response, Detachable ear cups for pro users', 'HD202.jpg', 26.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (12, 'Sennheiser RS120 Over-Ear Headphones', 'The RS 120 is an RF wireless headphone system with open, supra-aural headphones. They feature a transparent, well-balanced sound with excellent bass reproduction, making them an ideal choice for both hi-fi and TV use.', 'Detailed, Analytical Sound Reproduction With Strong, Bass Response, Perfectly Suitable For All Types Of Modern Music & Tv Applications', 'rs120.jpg', 84.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (13, 'Sennheiser CX 300B MK II Precision Enhanced Bass Earbuds', 'Offering a powerful, bass-driven stereo sound with greater clarity and improved dynamics is the CX 300-II ear-canal phone.', 'Excellent voice clarity and comfortable fit, Excellent bass response, Convenient carrying pouch included, Customizable ear adapter system achieves the perfect fit', 'cx01.jpg', 24.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (14, 'Skullcandy S2IKDY-010 Ink\'d 2.0 Earbud Headphones with Mic\"', 'Skullcandy\'s best-selling INK\'D earbuds feature a customizable fit and 11mm speaker drivers that tattoo your temporal lobes with full-color sonic art. ', '11mm drivers with neodymium magnets for full-range sound. Two sizes of silicone gel earbud sleeves for a perfect fit. 1.3-meter nylon braided cable with gold-plated 3.5mm plug.', 'sk01.jpg', 13.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (15, 'Skullcandy S6SKFZ-003 Skullcrusher', 'The Skullcrusher boasts enough low-end WHOMP to buckle all comers, supplying the bass you need with clarity and precision dual-driver bass boost headphones.', '30mm power drivers plus 30mm subwoofer. In-line subwoofer control. Stashable/collapsing travel design. Soft leather-touch ear pillows.', 'sk02.jpg', 44.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (16, 'Sony MDR-ZX100 ZX Series Headphones', 'This lightweight and comfortable package is ideal for life on-the-go.', 'Closed-type supra-aural headphones with 30mm drivers, high quality and powerful sound, lightweight for maximum comfort', 'ZX100.jpg', 14.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (17, 'Sony MDR-V6 Headphones', 'A headset system designed for audio professionals.', 'Samarium-cobalt magnets and 40mm drivers for powerful, detailed sound, Over-ear design provides comfort and outstanding reduction of external noises', 'mdr.jpg', 53.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (18, 'Sony MDRRF985RK Wireless RF Headphone', 'Untangle your mind and relax with crisp, personal audio without wires. They also feature a comfortable headband and long battery life up to 25 hours. ', 'Wireless FM headphones for cord-free listening. 40mm driver units for expressive sound. Easy-adjust headband for long term comfort. ', 'mdr01.jpg', 99.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (19, 'Turtle Beach Ear Force PX51 Premium Wireless Dolby Digital Gaming Headset', 'To compete with the best players, you need the best equipment. PX51 gives you the Turtle Beach audio advantage with interference-free.', 'Dual-Band Wi-Fi Wireless - Interference-free wireless means clearer chat and game audio.', 'tb01.jpg', 249.99);
INSERT INTO `earphone`.`Item` (`itemID`, `name`, `description`, `specification`, `photoName`, `price`) VALUES (20, 'Turtle Beach Call of Duty: Black Ops II', 'The future is now with the Turtle Beach Call of Duty: Black Ops II Ear Force Tango Limited Edition Headset. ', 'Black Ops II - Optimized customizable presets. Black Ops II Voice prompts; Adjustable Surround Sound Angles. Rechargeable Battery', 'tb02.jpg', 399.99);

COMMIT;
