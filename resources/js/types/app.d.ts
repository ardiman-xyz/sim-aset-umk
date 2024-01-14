export type Building = {
    id: number;
    name: string;
    floors: Floor[];
    created_at: string;
    updated_at: string;
};

export type Floor = {
    id: number;
    name: string;
    rooms: Room[];
    created_at: string;
    updated_at: string;
};

export type Room = {
    id: number;
    name: string;
    created_at: string;
    updated_at: string;
};

export type Asset = {
    id: number;
    name: string;
    date_of_purchase: string;
    purchase_price: string;
    purchase_receipt: string;
    description: string;
    quantity: number;
    total_price: number;
    created_at: string;
    updated_at: string;
    categories: Category[] | [];
    condition: Condition;
    gallery: Gallery[];
    acquisition_method: AcquisitionMethod;
};

export type Category = {
    id: number;
    name: string;
};

export type Condition = {
    id: number;
    name: string;
};

export type Gallery = {
    id: number;
    file: string;
};

export type AcquisitionMethod = {
    id: number;
    name: string;
};
