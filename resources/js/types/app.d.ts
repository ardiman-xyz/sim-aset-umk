
export type Building = {
    id: number;
    name: string;
    floors: Floor[]
    created_at: string;
    updated_at: string;
}

export type Floor = {
    id: number;
    name: string;
    created_at: string;
    updated_at: string;
}
