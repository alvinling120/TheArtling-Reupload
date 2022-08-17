
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/21/2021 16:07:15
-- Generated from EDMX file: C:\Users\User\The_Artling_Web\TheArtling\TheArtling\Model\Artling.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [artling];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Artists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Artists];
GO
IF OBJECT_ID(N'[dbo].[Carts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carts];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Favourites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Favourites];
GO
IF OBJECT_ID(N'[dbo].[OrderDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderDetails];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Payment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Payment];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[ShippingDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ShippingDetails];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Artists'
CREATE TABLE [dbo].[Artists] (
    [ArtistId] int IDENTITY(1,1) NOT NULL,
    [ArtistName] nvarchar(50)  NULL,
    [ArtistProfile] nvarchar(50)  NULL,
    [ArtistHometown] nvarchar(50)  NULL,
    [UserId] int  NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [CartId] int IDENTITY(1,1) NOT NULL,
    [ProductId] int  NULL,
    [UserId] nvarchar(12)  NULL,
    [Quantity] smallint  NULL,
    [OrderId] nvarchar(50)  NULL,
    [TPrice] decimal(19,4)  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryId] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(50)  NULL,
    [ProductCategory] nvarchar(50)  NULL
);
GO

-- Creating table 'Favourites'
CREATE TABLE [dbo].[Favourites] (
    [FId] int IDENTITY(1,1) NOT NULL,
    [userId] nvarchar(12)  NULL,
    [ProductId] int  NULL
);
GO

-- Creating table 'OrderDetails'
CREATE TABLE [dbo].[OrderDetails] (
    [OrderDetailsId] int IDENTITY(1,1) NOT NULL,
    [ProductId] int  NULL,
    [Quantity] int  NULL,
    [OrderId] int  NULL,
    [OrderOrderId] int  NOT NULL,
    [Product_ProductId] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [OrderDate] datetime  NULL,
    [GrandTotal] decimal(19,4)  NULL,
    [ShippingFee] decimal(19,4)  NULL,
    [GrossTotal] decimal(19,4)  NULL,
    [UserId] nvarchar(12)  NULL,
    [UserId1] int  NOT NULL,
    [ShippingDetail_ShippingDetailsId] int  NOT NULL,
    [Payment_BillId] int  NOT NULL
);
GO

-- Creating table 'Payments'
CREATE TABLE [dbo].[Payments] (
    [BillId] int IDENTITY(1,1) NOT NULL,
    [BillDateTime] datetime  NULL,
    [CardNo] int  NULL,
    [CardExpiryDate] datetime  NULL,
    [CardCVV] int  NULL,
    [OrderId] int  NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(50)  NOT NULL,
    [ProductDescription] nvarchar(500)  NULL,
    [ProductImage] nvarchar(100)  NULL,
    [FinishedYear] datetime  NULL,
    [ProductLength] int  NULL,
    [ProductWidth] int  NULL,
    [CategoryId] int  NULL,
    [ArtistId] int  NULL,
    [UnitPrice] decimal(19,4)  NULL,
    [Quantity] int  NULL,
    [Status] nvarchar(1)  NULL,
    [ArtistArtistId] int  NOT NULL,
    [FavouriteFId] int  NOT NULL,
    [Category_CategoryId] int  NOT NULL
);
GO

-- Creating table 'ShippingDetails'
CREATE TABLE [dbo].[ShippingDetails] (
    [ShippingDetailsId] int  NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Street] nvarchar(100)  NULL,
    [City] nvarchar(50)  NULL,
    [State] nvarchar(50)  NULL,
    [Country] nvarchar(50)  NULL,
    [Poscode] int  NULL,
    [PhoneNumber] nvarchar(50)  NULL,
    [UserId] nvarchar(12)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(50)  NULL,
    [password] nvarchar(32)  NULL,
    [userId] nvarchar(12)  NULL,
    [signupDate] datetime  NULL,
    [accType] nvarchar(1)  NULL,
    [status] nvarchar(1)  NULL,
    [Favourite_FId] int  NOT NULL,
    [Cart_CartId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ArtistId] in table 'Artists'
ALTER TABLE [dbo].[Artists]
ADD CONSTRAINT [PK_Artists]
    PRIMARY KEY CLUSTERED ([ArtistId] ASC);
GO

-- Creating primary key on [CartId] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([CartId] ASC);
GO

-- Creating primary key on [CategoryId] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryId] ASC);
GO

-- Creating primary key on [FId] in table 'Favourites'
ALTER TABLE [dbo].[Favourites]
ADD CONSTRAINT [PK_Favourites]
    PRIMARY KEY CLUSTERED ([FId] ASC);
GO

-- Creating primary key on [OrderDetailsId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [PK_OrderDetails]
    PRIMARY KEY CLUSTERED ([OrderDetailsId] ASC);
GO

-- Creating primary key on [OrderId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [BillId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [PK_Payments]
    PRIMARY KEY CLUSTERED ([BillId] ASC);
GO

-- Creating primary key on [ProductId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [ShippingDetailsId] in table 'ShippingDetails'
ALTER TABLE [dbo].[ShippingDetails]
ADD CONSTRAINT [PK_ShippingDetails]
    PRIMARY KEY CLUSTERED ([ShippingDetailsId] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category_CategoryId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ProductCategory]
    FOREIGN KEY ([Category_CategoryId])
    REFERENCES [dbo].[Categories]
        ([CategoryId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory'
CREATE INDEX [IX_FK_ProductCategory]
ON [dbo].[Products]
    ([Category_CategoryId]);
GO

-- Creating foreign key on [ArtistArtistId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_ArtistProduct]
    FOREIGN KEY ([ArtistArtistId])
    REFERENCES [dbo].[Artists]
        ([ArtistId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArtistProduct'
CREATE INDEX [IX_FK_ArtistProduct]
ON [dbo].[Products]
    ([ArtistArtistId]);
GO

-- Creating foreign key on [User_Id] in table 'Artists'
ALTER TABLE [dbo].[Artists]
ADD CONSTRAINT [FK_UserArtist]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserArtist'
CREATE INDEX [IX_FK_UserArtist]
ON [dbo].[Artists]
    ([User_Id]);
GO

-- Creating foreign key on [Favourite_FId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserFavourite]
    FOREIGN KEY ([Favourite_FId])
    REFERENCES [dbo].[Favourites]
        ([FId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserFavourite'
CREATE INDEX [IX_FK_UserFavourite]
ON [dbo].[Users]
    ([Favourite_FId]);
GO

-- Creating foreign key on [Cart_CartId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserCart]
    FOREIGN KEY ([Cart_CartId])
    REFERENCES [dbo].[Carts]
        ([CartId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCart'
CREATE INDEX [IX_FK_UserCart]
ON [dbo].[Users]
    ([Cart_CartId]);
GO

-- Creating foreign key on [UserId1] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_UserOrder]
    FOREIGN KEY ([UserId1])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserOrder'
CREATE INDEX [IX_FK_UserOrder]
ON [dbo].[Orders]
    ([UserId1]);
GO

-- Creating foreign key on [OrderOrderId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderOrderDetail]
    FOREIGN KEY ([OrderOrderId])
    REFERENCES [dbo].[Orders]
        ([OrderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderOrderDetail'
CREATE INDEX [IX_FK_OrderOrderDetail]
ON [dbo].[OrderDetails]
    ([OrderOrderId]);
GO

-- Creating foreign key on [Product_ProductId] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_OrderDetailProduct]
    FOREIGN KEY ([Product_ProductId])
    REFERENCES [dbo].[Products]
        ([ProductId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetailProduct'
CREATE INDEX [IX_FK_OrderDetailProduct]
ON [dbo].[OrderDetails]
    ([Product_ProductId]);
GO

-- Creating foreign key on [ShippingDetail_ShippingDetailsId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_OrderShippingDetail]
    FOREIGN KEY ([ShippingDetail_ShippingDetailsId])
    REFERENCES [dbo].[ShippingDetails]
        ([ShippingDetailsId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderShippingDetail'
CREATE INDEX [IX_FK_OrderShippingDetail]
ON [dbo].[Orders]
    ([ShippingDetail_ShippingDetailsId]);
GO

-- Creating foreign key on [Payment_BillId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_OrderPayment]
    FOREIGN KEY ([Payment_BillId])
    REFERENCES [dbo].[Payments]
        ([BillId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderPayment'
CREATE INDEX [IX_FK_OrderPayment]
ON [dbo].[Orders]
    ([Payment_BillId]);
GO

-- Creating foreign key on [FavouriteFId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_FavouriteProduct]
    FOREIGN KEY ([FavouriteFId])
    REFERENCES [dbo].[Favourites]
        ([FId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FavouriteProduct'
CREATE INDEX [IX_FK_FavouriteProduct]
ON [dbo].[Products]
    ([FavouriteFId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------